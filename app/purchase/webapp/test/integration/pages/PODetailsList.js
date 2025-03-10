sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'order.purchase',
            componentId: 'PODetailsList',
            contextPath: '/PODetails'
        },
        CustomPageDefinitions
    );
});