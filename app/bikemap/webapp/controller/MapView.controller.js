sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/ui/model/json/JSONModel",
    "sap/ui/Device",
    "sap/m/MessageToast",
    "sap/m/MessageBox",
    "sap/ui/unified/Menu",
    "sap/ui/unified/MenuItem",
    "sap/ui/core/Fragment"
],
    /**
     * @param {typeof sap.ui.core.mvc.Controller} Controller
     */
    function (Controller, JSONModel, Fragment, Device, MessageToast, MessageBox, Menu, MenuItem) {
        "use strict";

        //ref: https://ui5.sap.com//#/entity/sap.ui.vbm.GeoMap/sample/sap.ui.vbm.sample.GeoMapSpots/code/Main.controller.js
        return Controller.extend("bikemap.controller.MapView", {
            onInit: function () {

                // Attach function to get user location to patternMatched event of the route, so location is updated on later navigations where no rerender is happening
                // and not only once on opening of the app (if defined only in onInit)
                this.getOwnerComponent().getRouter().getRoute("RouteMapView").attachPatternMatched(() => {
                    if (navigator.geolocation) {
                        navigator.geolocation.getCurrentPosition(this.showPosition.bind(this), this.setDefaultPosition.bind(this));
                    } else {
                        console.log("Geolocation is not supported by this browser");
                    };

                    console.log("Triggered location update")
                }, this);

                // Set the device model
                var oDeviceModel = new JSONModel(Device);

                try {
                    // Get user payment info
                    const mappingModel = this.getOwnerComponent().getModel("userMapping");
                    mappingModel.read("/getPaymentInfo", {
                        success: function (data, req) {
                            data = data["getPaymentInfo"]
                            const paymentMethod = data["paymentMethod"]
                            const additionalInfo = paymentMethod === "PayPal" ? data["email"] : data["cardNo"]
                            oDeviceModel.setData({
                                paymentMethod: paymentMethod,
                                paymentInfo: additionalInfo
                            });
                        }.bind(this),
                        error: (oError) => {
                            console.log(oError)
                        }
                    })


                } catch (error) {
                    console.log(error)
                }


                oDeviceModel.setDefaultBindingMode("OneWay");
                this.getView().setModel(oDeviceModel, "device");
                this._maxDist = 5;  // Define the maximum allowable radius for renting a bike in kilometers
            },

            onClickSpot: function (evt) {
                const spot = evt.getSource();
                const bindingContext = spot.getBindingContext();
                this.getView().setBindingContext(bindingContext); // Set binding context to context of the spot to be able to access it in the detail window
                // Get coordinats of user and bike
                const currentLatitude = this.getView().getModel("viewModel").getProperty("/currentLatitude");
                const currentLongitude = this.getView().getModel("viewModel").getProperty("/currentLongitude");
                const spotLatitude = bindingContext.getProperty("latitude");
                const spotLongitude = bindingContext.getProperty("longitude");

                const distance = this.haversine(currentLatitude, currentLongitude, spotLatitude, spotLongitude);
                const formattedDistance = (distance / 1000).toFixed(2); // Convert distance to kilometers and round to 2 decimal places

                // Update the viewModel with the calculated distance
                const viewModel = this.getView().getModel("viewModel");
                viewModel.setProperty("/distance", formattedDistance);
                viewModel.setProperty("/maxDist", this._maxDist)

                // Open detail window with title Bike #{serial number}
                evt.getSource().openDetailWindow(`Bike #${spot.getBindingContext().getProperty("serialNo")}`, "0", "0");
            },

            onOpenDetail: function (evt) {
                const bindingContext = this.getView().getBindingContext()

                if (this._details) {
                    this._details.then(oDetails => {
                        oDetails.destroy(true);
                    });
                }

                // Load detail window from the fragment definition
                this._details = this.loadFragment({
                    name: "bikemap.view.DetailWindow"
                }).then(oDetails => {
                    oDetails.setBindingContext(bindingContext, "spot");
                    return oDetails;
                })

                const place = evt.getParameter("contentarea").id

                // Display the detail window
                this._details.then(oDetails => {
                    oDetails.placeAt(place, "only")
                })
            },

            onCloseDetail: function (evt) {
                if (this._details) {
                    this._details.then(oDetails => {
                        oDetails.destroy(true);
                    });
                }
            },

            onMyOrdersPress: function (evt) {
                // Perform cross-navigation
                var oCrossAppNavigator = sap.ushell.Container.getService("CrossApplicationNavigation");
                oCrossAppNavigator.toExternal({
                    target: {
                        semanticObject: "serviceorders_by_customer",
                        action: "display"
                    }
                });
            },

            onHistoryPress: function (evt) {
                // Perform cross-navigation
                var oCrossAppNavigator = sap.ushell.Container.getService("CrossApplicationNavigation");
                oCrossAppNavigator.toExternal({
                    target: {
                        semanticObject: "orderhistory",
                        action: "display"
                    }
                });
            },

            //Success function for navigator.geolocation.getCurrentPosition(); Saves user location the viewModel
            showPosition: function (position) {
                var latitude = position.coords.latitude;
                var longitude = position.coords.longitude;

                var viewModel = new JSONModel({
                    currentLatitude: latitude,
                    currentLongitude: longitude
                });
                this.getView().setModel(viewModel, "viewModel");
            },

            //Error function for navigator.geolocation.getCurrentPosition(); sets location to Garching-Hochbrück
            setDefaultPosition: function (error) {
                console.log(error);
                const latitude = "48.24755";
                const longitude = "11.63096";

                const viewModel = new JSONModel({
                    currentLatitude: latitude,
                    currentLongitude: longitude
                });
                this.getView().setModel(viewModel, "viewModel");
            },

            //Unused; can be used to provide a small info popover to provide information about the maximum rental distance
            showDistanceInfo: function (oEvent) {
                const oButton = oEvent.getSource()

                if (!this._popover) {
                    this._popover = this.loadFragment({
                        name: "bikemap.view.DistanceInfo"
                    }).then(oDistance => {
                        return oDistance;
                    })
                }

                this._popover.then((oPopover) => {
                    oPopover.openBy(oButton);
                })
            },

            // Calculate distance between two coordinates
            haversine: function (lat1, lon1, lat2, lon2) {
                const R = 6371e3; // Radius of the earth in meters
                const rad = Math.PI / 180;
                const dLat = (lat2 - lat1) * rad;
                const dLon = (lon2 - lon1) * rad;
                lat1 = lat1 * rad;
                lat2 = lat2 * rad;
                const a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
                    Math.sin(dLon / 2) * Math.sin(dLon / 2) * Math.cos(lat1) * Math.cos(lat2);
                const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
                const distance = R * c;
                return distance;
            },

            formatDistance: function (distance) {
                if (distance) {
                    return parseFloat(distance).toFixed(2) + " km";
                } else {
                    return "";
                }
            },

            handleRentPress: function (evt) {
                var oDeviceModel = this.getView().getModel("device");
                const bindingContext = this.getView().getBindingContext();
                const distanceIn = this.getView().getModel("viewModel").getProperty("/distance");
                if(distanceIn > this._maxDist){ //Check if user is close enough to the bike
                    sap.m.MessageBox.error(`Too far away to rent - maximum distance: ${this._maxDist * 1000} meters`);
                    return;
                }
                var paymentMethod = oDeviceModel.getProperty("/paymentMethod");
                var paymentInfo = oDeviceModel.getProperty("/paymentInfo");

                // Create the dialog with the different payment options
                var oDialog = new sap.m.Dialog({
                    title: "Enter Payment Information",
                    content: [
                        new sap.m.FlexBox({
                            alignItems: "Start",
                            items: [
                                new sap.m.RadioButton({
                                    id: "paypalButton",
                                    text: "PayPal",
                                    select: function () {
                                        oEmailInput.setVisible(true);
                                        oEmailLabel.setVisible(true);
                                        oCardNumberInput.setVisible(false);
                                        oCardNumberLabel.setVisible(false);
                                        oCardHolderInput.setVisible(false);
                                        oCardHolderLabel.setVisible(false);
                                        oExpirationDateInput.setVisible(false);
                                        oExpirationDateLabel.setVisible(false);
                                        oOtherPaymentInfo.setVisible(false); // Hide the "Other" payment information text
                                    }
                                }),
                                new sap.m.RadioButton({
                                    id: "creditcardButton",
                                    text: "Credit Card",
                                    select: function () {
                                        oEmailInput.setVisible(false);
                                        oEmailLabel.setVisible(false);
                                        oCardNumberInput.setVisible(true);
                                        oCardNumberLabel.setVisible(true);
                                        oCardHolderInput.setVisible(true);
                                        oCardHolderLabel.setVisible(true);
                                        oExpirationDateInput.setVisible(true);
                                        oExpirationDateLabel.setVisible(true);
                                        oOtherPaymentInfo.setVisible(false); // Hide the "Other" payment information text
                                    }
                                }),
                                new sap.m.RadioButton({
                                    id: "otherButton",
                                    text: "Use Previous Payment Info",
                                    select: function () {
                                        oEmailInput.setVisible(false);
                                        oEmailLabel.setVisible(false);
                                        oCardNumberInput.setVisible(false);
                                        oCardNumberLabel.setVisible(false);
                                        oCardHolderInput.setVisible(false);
                                        oCardHolderLabel.setVisible(false);
                                        oExpirationDateInput.setVisible(false);
                                        oExpirationDateLabel.setVisible(false);
                                        oOtherPaymentInfo.setVisible(true);
                                    }
                                })
                            ]
                        }),
                        new sap.m.Label({ text: "Email:", visible: false, id: "emailLabel" }),
                        new sap.m.Input({
                            id: "emailInput",
                            type: sap.m.InputType.Email,
                            visible: false // Initially hidden
                        }),
                        new sap.m.Label({ text: "Card Number:", visible: false, id: "cardNumberLabel" }),
                        new sap.m.Input({
                            id: "cardNumberInput",
                            type: sap.m.InputType.Text,
                            visible: false // Initially hidden
                        }),
                        new sap.m.Label({ text: "Card Holder:", visible: false, id: "cardHolderLabel" }),
                        new sap.m.Input({
                            id: "cardHolderInput",
                            type: sap.m.InputType.Text,
                            visible: false // Initially hidden
                        }),
                        new sap.m.Label({ text: "Expiration Date:", visible: false, id: "expirationDateLabel" }),
                        new sap.m.Input({
                            id: "expirationDateInput",
                            type: sap.m.InputType.Date,
                            visible: false // Initially hidden
                        }),
                        new sap.m.Text({
                            id: "paymentInfo",
                            text: "Payment Method: " + (paymentMethod ? paymentMethod : "") + "\nPayment Info: " + (paymentInfo ? paymentInfo : ""),
                            visible: false // Initially hidden
                        })
                    ],
                    beginButton: new sap.m.Button({
                        text: "Start Ride",
                        type: "Accept",
                        press: function () {
                            const mappingModel = this.getOwnerComponent().getModel("userMapping");
                            // Saving the relevant payment data into the HANA DB
                            // Check that a payment method has been selected
                            if (oPaypalButton.getSelected() == false && oCreditcardButton.getSelected() == false && oOtherButton.getSelected() == false) {
                                sap.m.MessageBox.error("Please choose a payment method");
                                return;
                            }
                            // For PayPal: Check that a valid e-mail has been entered
                            if (oPaypalButton.getSelected()) {
                                if (oEmailInput.getValue().length == 0) {
                                    sap.m.MessageBox.error("Please enter your PayPal email address");
                                    return;
                                }
                                const mailregex = /^\w+[\w\-+\.]*\@\w+([-\.]\w+)*\.[a-zA-Z]{2,}$/;
                                if (!mailregex.test(oEmailInput.getValue())) {
                                    sap.m.MessageBox.error("Please enter a valid email address");
                                    return;
                                }
                                mappingModel.create("/updatePaymentInfo", {
                                    "paymentMethod": "PayPal",
                                    "cardNo": ""
                                });
                            } 
                            // For credit card just check that values have been entered for all of the fields
                            else if (oCreditcardButton.getSelected()) {
                                if (oCardNumberInput.getValue().length === 0) {
                                    sap.m.MessageBox.error("Please enter the card number");
                                    return;
                                }

                                if (oCardHolderInput.getValue().length === 0) {
                                    sap.m.MessageBox.error("Please enter the card holder's name");
                                    return;
                                }

                                if (oExpirationDateInput.getValue().length === 0) {
                                    sap.m.MessageBox.error("Please enter the expiration date");
                                    return;
                                }
                                mappingModel.create("/updatePaymentInfo", {
                                    "paymentMethod": "Credit Card",
                                    "cardNo": oCardNumberInput.getValue()
                                });
                            } 

                            // Display loading indicator during request
                            const busyDialog = this.loadFragment({
                                name: "bikemap.view.BusyDialog"
                            }).then((oBusyDialog) => {
                                return oBusyDialog;
                            })

                            const currDate = new Date();

                            const oModel = this.getOwnerComponent().getModel()

                            busyDialog.then(function (oBusyDialog) {
                                oBusyDialog.open()
                                // Create the service order
                                oModel.create("/ServiceOrders", {
                                    "type": "SVO1",
                                    "startDate": currDate.toISOString(),
                                    "isComplete": "",
                                    "isReleased": "",
                                    "customer": "10100001",
                                    "currency": "EUR",
                                    "orderItems": {
                                        "results": [{
                                            "Product": "BR002",
                                            "Quantity": "1"
                                        }]
                                    },
                                    "refObjects": {
                                        "results": [{
                                            "equipmentID": bindingContext.getProperty("ID")
                                        }]
                                    },
                                    "responsible": {
                                        "results": [{
                                            "employeeID": "9980000063",
                                            "isMain": true
                                        }]
                                    }
                                },
                                    {
                                        success: (data) => {
                                            oModel.refresh() // Refresh the model data (bikes) to account for the newly rented bike in the map
                                            oBusyDialog.close()
                                            oDialog.close()
                                            sap.m.MessageBox.success(`Created Service Order`, {
                                                details: {
                                                    "Order ID": data["ID"],
                                                    "Rental start timestamp": currDate.toLocaleString()
                                                },
                                                actions: [sap.m.MessageBox.Action.OK, "Rent another bike"], //Two actions: one that navigates to the order list report, one to stay on the map
                                                onClose: (oAction) => {
                                                    if (oAction === sap.m.MessageBox.Action.OK) {
                                                        sap.ushell.Container.getServiceAsync("CrossApplicationNavigation").then(navigator => {
                                                            navigator.toExternal({
                                                                target: {
                                                                    semanticObject: "serviceorders_by_customer",
                                                                    action: "display"
                                                                }
                                                            })
                                                        })
                                                    }
                                                }
                                            })
                                        },
                                        error: (oError) => {
                                            console.log(oError)
                                            oModel.refresh()
                                            oBusyDialog.close()
                                            oDialog.close()
                                            sap.m.MessageBox.error("Failed to create Service Order", {
                                                details: oError
                                            })
                                        }
                                    })
                            }.bind(this))
                        }.bind(this)
                    }),
                    endButton: new sap.m.Button({
                        text: "Cancel",
                        type: "Reject",
                        press: function () {
                            oDialog.close();
                        }
                    }),
                    afterClose: function () {
                        oDialog.destroy();
                    }.bind(this)
                });

                var oPaypalButton = sap.ui.getCore().byId("paypalButton"); // Reference to the paypal radio button
                var oCreditcardButton = sap.ui.getCore().byId("creditcardButton"); // Reference to the creditcard radio button
                var oOtherButton = sap.ui.getCore().byId("otherButton"); // Reference to the other radio button
                var oEmailInput = sap.ui.getCore().byId("emailInput"); // Reference to the email input field
                var oEmailLabel = sap.ui.getCore().byId("emailLabel"); // Reference to the email label
                var oCardNumberInput = sap.ui.getCore().byId("cardNumberInput"); // Reference to the card number input field
                var oCardNumberLabel = sap.ui.getCore().byId("cardNumberLabel"); // Reference to the card number label
                var oCardHolderInput = sap.ui.getCore().byId("cardHolderInput"); // Reference to the card holder input field
                var oCardHolderLabel = sap.ui.getCore().byId("cardHolderLabel"); // Reference to the card holder label
                var oExpirationDateInput = sap.ui.getCore().byId("expirationDateInput"); // Reference to the expiration date input field
                var oExpirationDateLabel = sap.ui.getCore().byId("expirationDateLabel"); // Reference to the expiration date label
                var oOtherPaymentInfo = sap.ui.getCore().byId("paymentInfo");
                oDialog.open();
            },

            onExit: function () {
                if (this._details) {
                    this._details.then(oDetails => {
                        oDetails.destroy(true);
                    });
                }
            }
        });
    });
