const cds = require('@sap/cds')

module.exports = async (srv) => {
    srv.on('READ', 'customersMap', async (req) => {
        return cds.run(req.query)
    })

    srv.on('getPaymentInfo', async (req) => {
        const user = req.user.id
        const res = await cds.run(cds.parse.cql(`Select email, paymentMethod, cardNo from MappingService.customersMap where email='${user}'`))
        if (res[0]["cardNo"]) {
            res[0]["cardNo"] = res[0]["cardNo"].replace(/\d(?=\d{4})/g, "*"); // Masking credit card number
        }    
        return res
    })

    //updates payment method and card number of the user
    srv.on('updatePaymentInfo', async (req) => {
        const user = req.user.id
        await cds.run({UPDATE: {
            entity: {
                ref: [
                    {
                        id:'MappingService.customersMap',
                        where: [{ref: ['email']}, '=', {val: user}]
                    }
                ]
            },
            data: {paymentMethod: req.data.paymentMethod, cardNo: req.data.cardNo}
        }})
        return 200;
    })
}