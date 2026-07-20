sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"smart/procurement/smart/procurement/test/integration/pages/PurchaseRequestsList.gen",
	"smart/procurement/smart/procurement/test/integration/pages/PurchaseRequestsObjectPage.gen"
], function (JourneyRunner, PurchaseRequestsListGenerated, PurchaseRequestsObjectPageGenerated) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('smart/procurement/smart/procurement') + '/test/flp.html#app-preview',
        pages: {
			onThePurchaseRequestsListGenerated: PurchaseRequestsListGenerated,
			onThePurchaseRequestsObjectPageGenerated: PurchaseRequestsObjectPageGenerated
        },
        async: true
    });

    return runner;
});

