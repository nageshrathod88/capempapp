sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'order/purchase/test/integration/FirstJourney',
		'order/purchase/test/integration/pages/PODetailsList',
		'order/purchase/test/integration/pages/PODetailsObjectPage'
    ],
    function(JourneyRunner, opaJourney, PODetailsList, PODetailsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('order/purchase') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onThePODetailsList: PODetailsList,
					onThePODetailsObjectPage: PODetailsObjectPage
                }
            },
            opaJourney.run
        );
    }
);