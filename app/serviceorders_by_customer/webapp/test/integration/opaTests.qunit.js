sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'myorders/serviceordersbycustomer/test/integration/FirstJourney',
		'myorders/serviceordersbycustomer/test/integration/pages/ServiceOrdersByCustomerList',
		'myorders/serviceordersbycustomer/test/integration/pages/ServiceOrdersByCustomerObjectPage',
		'myorders/serviceordersbycustomer/test/integration/pages/ServiceOrderObjectsObjectPage'
    ],
    function(JourneyRunner, opaJourney, ServiceOrdersByCustomerList, ServiceOrdersByCustomerObjectPage, ServiceOrderObjectsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('myorders/serviceordersbycustomer') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheServiceOrdersByCustomerList: ServiceOrdersByCustomerList,
					onTheServiceOrdersByCustomerObjectPage: ServiceOrdersByCustomerObjectPage,
					onTheServiceOrderObjectsObjectPage: ServiceOrderObjectsObjectPage
                }
            },
            opaJourney.run
        );
    }
);