sap.ui.define([
    "sap/m/MessageToast"
], function(MessageToast) {
    'use strict';

    // custom button functionality to retrieve the billing document as a PDF (as a base64-encoded string in this case)
    // and download it
    return {
        handleBilling: function(oEvent) {
            var oModel = oEvent.getModel();
            const regex = /'([^']+)'/;
            const match = regex.exec(oEvent.sPath);
            const OrderID = match[0];
            console.log(OrderID)

            MessageToast.show("Fetching billing document...")
            const oContextBinding = oModel.bindContext(`/GetPDF(orderID=${OrderID})`)
            oContextBinding.requestObject().then(function (sPDF) {
                const pdfRAW = sPDF["value"];
                var a = window.document.createElement("a");
                a.href = 'data:application/pdf;base64,' + pdfRAW;
                a.download = `invoice-${OrderID.slice(1, -1)}.pdf`;
                document.body.appendChild(a);
                a.click();
                document.body.removeChild(a);
            }, function (oError) {
                MessageToast.show(oError)
            })
        }
    };
});