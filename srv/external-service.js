const cds = require('@sap/cds')

const log = cds.log('external-service')

module.exports = async (srv) => {
    const partnerAPI = await cds.connect.to('API_BUSINESS_PARTNER')
    const equiAPI = await cds.connect.to('OP_API_EQUIPMENT')
    const orderAPI = await cds.connect.to('OP_API_SERVICE_ORDER_SRV_0001')
    const measDocAPI = await cds.connect.to('MEASUREMENTDOCUMENT_0001')
    const measPointAPI = await cds.connect.to('OP_API_MEASURINGPOINT_0001')
    const confirmationAPI = await cds.connect.to('OP_API_SERVICE_CONFIRMATION_SRV_0001')
    const billingdocAPI = await cds.connect.to('OP_API_BILLING_DOCUMENT_SRV_0001')
    const productAPI = await cds.connect.to('OP_PRODUCT_0001')

    // Define the model
    cds.on("bootstrap", (app) => {
        app.model({
         name: "bikeRentalModel", // The name of your model
        entities: [ServiceOrdersByCustomer],
        });
    });

    srv.on('READ', ['Customers', 'CustomerAddresses', 'CustomerMails'], async (req) => {
        return partnerAPI.run(req.query)
    })

    srv.on('UPDATE', 'Bikes', async (req) => {
        return equiAPI.send({query: req.query, headers: {"Content-Type": "application/json", "If-Match": "*"}})
    })

    srv.on(['READ', 'CREATE'], 'Bikes', async (req) => {
        res = await equiAPI.run(req.query)
        return res;
    })

    // Create measuring points and first measurement document for newly created bike
    // Bike location is chosen randomly within munich
    srv.after('CREATE', 'Bikes', async (res) => {
        const bikeID = res["ID"];
        const characteristics = {
            "879": "GPS Longitude",
            "880": "GPS Latitude",
            "881": "Bike Status (1=AVLB, 2=Rented)"
        }
        const defaultValues = {
            "879": () => {return Math.random() * (11.68 - 11.44) + 11.44;},
            "880": () => {return Math.random() * (48.26 - 48.07) + 48.07;},
            "881": () => {return 1;}
        }
        const units = {
            "879": "DEG",
            "880": "DEG",
            "881": "VAL"
        }
        for (const characteristic in characteristics) {
            const point = await measPointAPI.run({INSERT: {
                into: "ExternalService.MeasuringPoints",
                entries: [{description: characteristics[characteristic], category: "M"
                , equipmentID: bikeID, characteristic: characteristic}]
            }})
            const pos = defaultValues[characteristic]()
            await measDocAPI.run({INSERT: {
                into: {ref: ["ExternalService.MeasuringDocs"]},
                entries: [{pointID: point["ID"], readingValue: pos
                , unit: units[characteristic]}]
            }})
        }
        log.info(`Created Measuring Points and Measurement Documents for bike ${bikeID}`);
    })

    // Read Bikes enriched with latest measurement document readings for coordinates/status
    srv.on('READ', 'BikesMap', async (req) => {
        const pointsQuery = cds.parse.cql(`select ID, equipmentID, characteristic 
        from ExternalService.MeasuringPoints`)
        const points = await measPointAPI.run(pointsQuery)
        const pointsMap = points.reduce((acc, curr) => {
            if (!acc[curr["equipmentID"]]) {
                acc[curr["equipmentID"]] = [];
            }
            acc[curr["equipmentID"]].push([curr["ID"], curr["characteristic"]]);
            return acc;
        }, {})

        const docsQuery = cds.parse.cql(`SELECT from ExternalService.MeasuringDocs order by ID limit 5000`)
        const docs = await measDocAPI.run(docsQuery)
        const latestDocs = docs.reduce((acc, curr) => {
            if (!acc[curr["pointID"]] || curr["readingDate"] > acc[curr["pointID"]]["readingDate"]) {
                acc[curr["pointID"]] = curr;
            }
            return acc;
        }, {})

        const bikeQuery = cds.parse.cql(`SELECT * from ExternalService.Bikes where productID = 'CTBR1000'`)
        const bikes = await equiAPI.run(bikeQuery)
        const res = bikes.reduce((acc, curr) => {
            if (pointsMap[curr["ID"]]) {
                pointsMap[curr["ID"]].forEach(([pointID, characteristic]) => {
                    if (latestDocs[pointID]) {
                        curr[characteristic == "879" ? "longitude": 
                              characteristic == "880" ? "latitude": 
                                                          "status"] = latestDocs[pointID]["readingValue"]
                    }                
                })
            }
            acc.push(curr);
            return acc;
        }, [])
        return res
    })

    //Enable users to read their own (single) service order
    srv.on('READ', 'ServiceOrders', async (req) => {
        const mapping = await cds.run(cds.parse.cql(`Select * from MappingService.customersMap
        where email='${req.user.id}'`))
        const customerID = mapping[0]["bupaID"]
        const res = await orderAPI.run(req.query);
        if (res[0]["customer"] !== customerID) {
            req.reject({
                code: 401,
                message: "Not authorized to access this service order"
            })
        }
        return res
    })    

    //Creates a service order for the user
    srv.on('CREATE', 'ServiceOrders', async (req) => {

        //Find correct Business Partner ID in S/4 corresponding to the id/email of the customer and add it to the request payload
        const identifier = req.user.id;
        const mapping = await cds.run(cds.parse.cql(`Select * from MappingService.customersMap
        where email='${identifier}'`))
        const customerID = mapping[0]["bupaID"]
        const data = req.query.INSERT.entries[0]
        data["customer"] = customerID //Replace the user email with the business partner ID read from the mapping table

        return orderAPI.run(req.query)
    })

    // Custom handler to automatically release the newly created Service Order, setting end date to null and updating the bike status
    srv.after('CREATE', 'ServiceOrders', async (res) => {
        const query = {UPDATE:{
            entity: {
                ref: [
                    {
                        id:'ExternalService.ServiceOrders',
                        where: [{ref: ['ID']}, '=', {val: res['ID']}]
                    }
                ]
            },
            data: {isReleased: 'X', endDate: null, ID: res['ID']}
        }}
        orderAPI.send({query: query, headers: {"Content-Type": "application/json", "If-Match": "*"}}) //Updates need a If-Match:* header

        const bikeID = res["refObjects"][0]["equipmentID"]

        // set the status of the bike to 2 (rented)
        const statusPointQuery = {SELECT: {
            from: { ref: [ 'ExternalService.MeasuringPoints' ] },
            where: [
                { ref: [ 'characteristic' ] },
                '=',
                { val: '881' },
                'and',
                { ref: [ 'equipmentID' ] },
                '=',
                { val: bikeID }
                ]
            }
        }
        const pointRes = await measPointAPI.run(statusPointQuery);
        const pointID = pointRes[0]["ID"]

        await measDocAPI.run({INSERT: {
            into: {ref: ["ExternalService.MeasuringDocs"]},
            entries: [{pointID: pointID, readingValue: 2
            , unit: "VAL"}]
        }})
    })

    srv.on('UPDATE', 'ServiceOrders', async (req) => {
        return orderAPI.send({query: req.query, headers: {"Content-Type": "application/json", "If-Match": "*"}})
    })

    srv.on(['READ', 'CREATE'], 'ServiceConfirmations', async (req) => {
        return await confirmationAPI.run(req.query)
    })

    // Custom handler to set further information correlated with the creation of a service confirmation and 
    // the associated end of the rental
    srv.after('CREATE', 'ServiceConfirmations', async (res) => {

        //Set end date in Service Order
        const orderDateQuery = {UPDATE: {
            entity: {
                ref: [
                    {
                        id:'ExternalService.ServiceOrders',
                        where: [{ref: ['ID']}, '=', {val: res["orderID"]}]
                    }
                ]
            },
            data: {endDate: new Date().toISOString()}
        }}

        await orderAPI.run(orderDateQuery)

        //Update bike status
        const bikeID = res["refObjects"][0]["equipmentID"];

        const statusPointQuery = {SELECT: {
            from: { ref: [ 'ExternalService.MeasuringPoints' ] },
            where: [
                { ref: [ 'characteristic' ] },
                '=',
                { val: '881' },
                'and',
                { ref: [ 'equipmentID' ] },
                '=',
                { val: bikeID }
                ]
            }
        }
        const pointRes = await measPointAPI.run(statusPointQuery);
        const pointID = pointRes[0]["ID"]

        await measDocAPI.run({INSERT: {
            into: {ref: ["ExternalService.MeasuringDocs"]},
            entries: [{pointID: pointID, readingValue: 1
            , unit: "VAL"}]
        }})
    })

    srv.on(['READ', 'CREATE'], 'MeasuringDocs', async (req) => {
        log.info(req.query)
        return measDocAPI.run(req.query)
    })

    srv.on(['READ', 'CREATE'], 'MeasuringPoints', async (req) => {
        return measPointAPI.run(req.query)
    })    
    
    //Read all uncompleted service orders for a specific customer 
    srv.on('READ', 'ServiceOrdersByCustomer', async (req) => {
        const identifier = req.user.id;
        const mapping = await cds.run(cds.parse.cql(`Select * from MappingService.customersMap
        where email='${identifier}'`))
        const customerID = mapping[0]["bupaID"]
    
        if (!customerID) {
          throw new Error('customerID is required');
        }
        
        // Add the filter condition to req.query
        
        req.query.SELECT.where = [
            { ref: [ 'customer' ] },
            '=',
            { val: customerID },
            'and',
            { ref: [ 'isComplete' ] },
            '=',
            { val: '' },
            'and',
            { ref: [ 'isReleased' ] },
            '=',
            { val: 'X' },
            'and',
            { ref: [ 'type' ] },
            '=',
            { val: 'SVO1' }
        ];

        // Since there is a field not present in the remote entity (currentDuration) that only gets calculated on querying
        // this needs to be filtered out specifically from the selected columns otherwise there will be an error
        const params = req.query.SELECT

        if (params.hasOwnProperty("columns")) {
            let pos = params["columns"].indexOf("*");
            if (pos > -1) {
                params["columns"].splice(pos, 1)
                const cols = ["ID", "startDate", "endDate",
                "isComplete", "customer", "cost", "currency"]
                cols.forEach((col) => {
                    params["columns"].unshift({ref: [col]})
                })
            }

            pos = params["columns"].findIndex(col => {
                return typeof col === 'object' && col && col.hasOwnProperty("ref") && col.ref.indexOf("currentDuration") > -1
            });
            if (pos > - 1) {
                params["columns"].splice(pos, 1)
            }
        }
        
        const serviceOrders = await orderAPI.run(req.query); 
        return serviceOrders;        
      });

    // Calculation of the custom duration field based on the start date of the order
    srv.after('READ', 'ServiceOrdersByCustomer', (each) => {
        const start = new Date(each.startDate)
        const durationMin = Math.ceil((new Date() - start) / 1000 / 60)
        each["currentDuration"] = `${Math.floor(durationMin / 60)}:${(durationMin % 60).toLocaleString("en-US", {minimumIntegerDigits: 2, useGrouping: false})} h`
    })

    srv.on("READ", "BillingDocs", async (req) => {
        return billingdocAPI.run(req.query)
    })

    // Get the PDF for a billing document based on a provided service order ID (used in Service Order History)
    srv.on("GetPDF", async (req) => {
        const doc = await billingdocAPI.run(cds.parse.cql(`Select ID, customer from ExternalService.BillingDocs
        where orderID = '${req.data.orderID}'`))
        if (!doc.length) {
            req.reject({
                code: 404,
                message: `No Billing Document found for OrderID ${req.data.orderID}`
            })
        }

        const mapping = await cds.run(cds.parse.cql(`Select * from MappingService.customersMap
        where email='${req.user.id}'`))
        const customerID = mapping[0]["bupaID"]
        if (doc[0]["customer"] !== customerID) { // Check if user is the one who the order belongs to
            req.reject({
                code: 401,
                message: "Not authorized to access this billing document"
            })
        }

        const billID = doc[0]["ID"]
        const pdfObject = await billingdocAPI.send("GET", `/GetPDF?BillingDocument='${billID}'`)
        return pdfObject["GetPDF"]["BillingDocumentBinary"]
    })


    // Similar to ServiceOrderByCustomer, reads all completed service orders with an end date
    srv.on('READ', 'ServiceOrderHistory', async (req) => {
        //const rcustomerId = req.user.id;
        const identifier = req.user.id;
        const mapping = await cds.run(cds.parse.cql(`Select * from MappingService.customersMap
        where email='${identifier}'`))
        const customerID = mapping[0]["bupaID"]
        
        if (!customerID) {
          throw new Error('customerID is required');
        }
    
        log.info(`on READ ServiceOrderHistory - customerID: ${customerID}`);
        
        // Add the filter condition to req.query
        
        req.query.SELECT.where = [
            { ref: [ 'customer' ] },
            '=',
            { val: customerID },
            'and',
            { ref: [ 'isComplete' ] },
            '=',
            { val: 'X' },
            'and',
            { ref: [ 'type' ] },
            '=',
            { val: 'SVO1' },
            'and',
            { ref: [ 'endDate' ] },
            'ne',
            { val: null }
        ];

        // Since there are two fields calculated at runtime, both need to be accounted for in the selected columns
        const params = req.query.SELECT

        if (params.hasOwnProperty("columns")) {
            let pos = params["columns"].indexOf("*");
            if (pos > -1) {
                params["columns"].splice(pos, 1)
                const cols = ["ID", "startDate", "endDate",
                "isComplete", "customer", "cost", "currency"]
                cols.forEach((col) => {
                    params["columns"].unshift({ref: [col]})
                })
            }

            pos = params["columns"].findIndex(col => {
                return typeof col === 'object' && col && col.hasOwnProperty("ref") && col.ref.indexOf("currentDuration") > -1
            });
            if (pos > - 1) {
                params["columns"].splice(pos, 1)
            }

            pos = params["columns"].findIndex(col => {
                return typeof col === 'object' && col && col.hasOwnProperty("ref") && col.ref.indexOf("cost") > -1
            });
            if (pos > - 1) {
                params["columns"].splice(pos, 1)
            }
        }
        
        const serviceOrders = await orderAPI.run(req.query); 
        return serviceOrders;        
      });


    // Calculation of total rental duration and cost based on start and end dates of the order
    srv.after('READ', 'ServiceOrderHistory', (each) => {
        const start = new Date(each.startDate)
        const end = new Date(each.endDate)
        const durationMin = Math.ceil((end - start) / 1000 / 60)
        const actualCost = Number((durationMin * 0.119).toFixed(2)) // cost hard-coded to 11.9 cents because reading from S/4 did not provide the correct value
        each["currentDuration"] = `${Math.floor(durationMin / 60)}:${(durationMin % 60).toLocaleString("en-US", {minimumIntegerDigits: 2, useGrouping: false})} h`
        each["cost"] = actualCost
    })

    
    // Create new measuring documents with updated bike locations for the provided bike ID
    srv.on("updateBikeLocation", async (req) => {
        const pointsQuery = cds.parse.cql(`select ID, characteristic 
        from ExternalService.MeasuringPoints where equipmentID='${req.data.bikeID}'`)
        const points = await measPointAPI.run(pointsQuery)
        points.forEach(async ({ID, characteristic}) => {
            if (characteristic === "879" || characteristic === "880"){
                await measDocAPI.run({INSERT: {
                    into: {ref: ["ExternalService.MeasuringDocs"]},
                    entries: [{pointID: ID, readingValue: characteristic === "879" ? req.data.longitude : req.data.latitude
                    , unit: "DEG"}]
                }})
            }
        })
        return 200;
    })


    // Helper function to update manufacturer and model of all bikes
    srv.on("updateBikeInfos", async (req) => {
        const bikeIDs = await equiAPI.run(cds.parse.cql("select ID from ExternalService.Bikes where productID = 'CTBR1000'"))
        for (let {ID} of bikeIDs) {
            const updateQuery = {UPDATE:{
                entity: {
                    ref: [
                        {
                            id:'ExternalService.Bikes',
                            where: [
                                {ref: ['ID']}, '=', {val: ID},
                                'and', {ref: ['validTo']}, '=', {val: "9999-12-31"}]
                        }
                    ]
                },
                data: {manufacturer: req.data.manufacturer, model: req.data.model}
            }}
            await equiAPI.send({query: updateQuery, headers: {"Content-Type": "application/json", "If-Match": "*"}})
        }
    })
      
}