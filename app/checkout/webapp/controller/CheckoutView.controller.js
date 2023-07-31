sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/ui/model/json/JSONModel",
    "sap/m/MessageToast",
    "sap/m/MessageBox",
    "sap/base/util/UriParameters"
], function (Controller, JSONModel, MessageToast, MessageBox, UriParameters) {
    "use strict";

    return Controller.extend("checkout.controller.CheckoutView", {
        onInit: function () {
            // Create a new JSONModel
            const oModel = new JSONModel();
        
            // Get the order ID from the URL parameters
            const complete_url = window.location.href;
            const pieces = complete_url.split("?");
            const params = pieces[2].split("&");

            let ID = params.find(function (param) {
                return param.startsWith("ID=");
            });
        
            if (ID) {
                ID = ID.split("=")[1];
            } else {
                ID = "8000000091"
            }        

            // Get the two OData models defined in the manifest to run the requests
            const oDataModel = this.getOwnerComponent().getModel()
            const mappingModel = this.getOwnerComponent().getModel("userMapping")

            // First read all relevant data for the specific service order
            oDataModel.read("/ServiceOrders", {
                urlParameters: {"$expand": "refObjects,orderItems/priceElement"},
                filters: [
                    new sap.ui.model.Filter({path: "ID", operator: sap.ui.model.FilterOperator.EQ, value1: ID})
                ],
                success: function (data, req) {
                    data = data["results"][0]
                    ID = data["ID"]
                    const startDate = data["startDate"]
                    const complete = data["isComplete"] === "X"
                    const customer = data["customer"]
                    const productID = data["orderItems"]["results"][0]["Product"]
                    const orderItemID = data["orderItems"]["results"][0]["ID"]
                    const pricePer = data["orderItems"]["results"][0]["priceElement"]["results"][0]["rate"] * 1.19 //multiplied with 1.19 to account for tax
                    const bikeID = data["refObjects"]["results"][0]["equipmentID"]   
                    const currency = data["orderItems"]["results"][0]["priceElement"]["results"][0]["currency"]  

                    // Calculate rental duration in minutes
                    const now = new Date();
                    const start = new Date(startDate);
                    const rentalDurationSeconds = Math.ceil((now - start) / 1000);
                    let rentalDuration = Math.ceil(rentalDurationSeconds / 60);

                    // Calculate cost based on rental duration
                    const cost = +(Math.round((rentalDuration * pricePer) + "e+2")  + "e-2"); // Total cost with two decimal places

                    // Updates the cost and duration displayed to provide up-to-date information
                    setTimeout(() => {
                        rentalDuration = oModel.getProperty("/rentalDuration") + 1;
                        oModel.setProperty("/rentalDuration", rentalDuration)
                        oModel.setProperty("/cost", +(Math.round((rentalDuration * oModel.getProperty("/pricePer")) + "e+2")  + "e-2"))
                        setInterval(() => {
                            rentalDuration = oModel.getProperty("/rentalDuration") + 1;
                            oModel.setProperty("/rentalDuration", rentalDuration)
                            oModel.setProperty("/cost", +(Math.round((rentalDuration * oModel.getProperty("/pricePer")) + "e+2")  + "e-2"))
                        }, 60000)
                    }, (60 - rentalDurationSeconds % 60) * 1000)

                    // Read payment data for the customer as well
                    mappingModel.read("/getPaymentInfo", {
                        success: function (data, req) {
                            data = data["getPaymentInfo"]
                            const paymentMethod = data["paymentMethod"]
                            const additionalInfo = paymentMethod === "PayPal" ? data["email"] : data["cardNo"]

                            // Save all relevant data from both requests into the created JSON model
                            oModel.setData({
                                userId: customer,
                                ID: ID,
                                cost : cost,
                                currency : currency,
                                rentalDuration : rentalDuration,
                                productID: productID,
                                startDate: start,
                                orderItemID: orderItemID,
                                bikeID: bikeID,
                                pricePer: pricePer,
                                paymentMethod: paymentMethod,
                                paymentInfo: additionalInfo,
                                complete: complete
                            });
                        }.bind(this)
                    })

                    // Set the model for later access
                    this.getView().setModel(oModel)
                }.bind(this),
                error: (oError) => {
                    console.log(oError)
                }
            })
        },

        onConfirmPress: function () {
            var oModel = this.getView().getModel();
            var selectedIndex = oModel.getProperty("/selectedPaymentIndex");
            const endDate = new Date();
            const startDate = oModel.getProperty("/startDate");
            const duration = Math.ceil((endDate - startDate) / 1000 / 60);
            const productID = oModel.getProperty("/productID");
            const orderID = oModel.getProperty("/ID");
            const orderItemID = oModel.getProperty("/orderItemID")
            const bikeID = oModel.getProperty("/bikeID")

            const oDataModel = this.getOwnerComponent().getModel();

            if (selectedIndex === -1) {
                MessageBox.error("Please select a payment method");
            } else {
                // Check user's location
                navigator.geolocation.getCurrentPosition(
                    function (position) {
                        // User's current coordinates
                        var latitude = position.coords.latitude;
                        var longitude = position.coords.longitude;

                        // Coordinates of Munich
                        var munichLatitude = 48.1351;
                        var munichLongitude = 11.5820;

                        // Calculate the distance between user's location and Munich
                        var distance = getDistance(latitude, longitude, munichLatitude, munichLongitude);
                        // Define the maximum allowable radius in kilometers
                        var radius = 25; // Adjust the radius as needed

                        if (distance <= radius) {
                            // Display a loading indicator during the request to provide visual feedback
                            const busyDialog = this.loadFragment({
                                name: "checkout.view.BusyDialog"
                            }).then((oBusyDialog) => {
                                return oBusyDialog;
                            });

                            busyDialog.then(oBusyDialog => {
                                oBusyDialog.open();

                                // End the rental through the creation of the service confirmation
                                oDataModel.create("/ServiceConfirmations",
                                {
                                    "orderID": orderID,
                                    "isFinal": "Y",
                                    "type": "SVC1",
                                    "isComplete": "X",
                                    "confirmationItem": {
                                        "results" : [{
                                            "Product": productID,
                                            "Quantity": duration,
                                            "QuantityUnit": "MIN",
                                            "execEmployee": "9980000044",
                                            "actualDuration": 1,
                                            "durationUnit": "MIN",
                                            "orderID": orderID,
                                            "orderItemID": orderItemID
                                        }]
                                    },
                                    "refObjects": {
                                        "results": [{
                                            "equipmentID": bikeID
                                        }]
                                    }                       
                                },
                                {
                                    success: () => {
                                        // Updates bike location to current user location when ending the rental
                                        oDataModel.create("/updateBikeLocation", {
                                            "bikeID": bikeID,
                                            "latitude": latitude,
                                            "longitude": longitude
                                        },
                                        {
                                            success: () => {
                                                oBusyDialog.close()
                                                MessageBox.success("Checkout complete! Thank you for using BikeRental!", {
                                                    details: {
                                                        "Order ID": orderID,
                                                        "Rental Duration": `${duration} Minutes`,
                                                        "Return Timestamp": endDate.toLocaleString()
                                                    },
                                                    onClose: function () {
                                                        // Perform cross-navigation back to the map
                                                        var oCrossAppNavigator = sap.ushell.Container.getService("CrossApplicationNavigation");
                                                        oCrossAppNavigator.toExternal({
                                                            target: {
                                                                semanticObject: "bikemap",
                                                                action: "display"
                                                            }
                                                        });
                                                    }
                                                });
                                            },
                                            error: (oError) => {
                                                oBusyDialog.close()
                                                MessageBox.error("Failed to update bike location", {
                                                    details: oError
                                                })
                                            }
                                        })
                                    },
                                    error: (oError) => {
                                        oBusyDialog.close()
                                        MessageBox.error("Failed to complete checkout. Please try again", {
                                            details: oError
                                        })
                                    }
                                })
                            })             
                        } else {
                            MessageBox.error("You are not within the specified radius around Munich. Please proceed to Munich to complete the checkout.");
                        }
                    }.bind(this),
                    function (error) {
                        // Error occurred while getting user's location
                        MessageBox.error("Unable to retrieve your location. Please make sure location services are enabled and try again.");
                    }
                );
            }
        },

        // Prepend "Order #" to the order ID
        formatTitle: function (ID) {
            if (ID) {
                return "Order #" + ID + (this.getView().getModel().getProperty("/complete") ? " (Completed)" : " (Active)");
            } else {
                return "Order";
            }
        }

        
        
    });

    // Function to calculate the distance between two sets of coordinates using the Haversine formula
    function getDistance(lat1, lon1, lat2, lon2) {
        var R = 6371; // Radius of the earth in kilometers
        var dLat = deg2rad(lat2 - lat1); // deg2rad below
        var dLon = deg2rad(lon2 - lon1);
        var a =
            Math.sin(dLat / 2) * Math.sin(dLat / 2) +
            Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.sin(dLon / 2) * Math.sin(dLon / 2);
        var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
        var distance = R * c; // Distance in kilometers
        return distance;
    }

    function deg2rad(deg) {
        return deg * (Math.PI / 180);
    }

    
});
