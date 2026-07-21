const cds = require('@sap/cds');

module.exports = cds.service.impl(async function () {
    const { PurchaseRequests, NumberRanges } = this.entities;
    this.before('CREATE', 'PurchaseRequests', async (req) => {
        console.log("===== BEFORE CREATE TRIGGERED =====");
        console.log(req.data);
        const numberRange = await SELECT.one.from(NumberRanges).where({ object: 'PR' });
        if (!numberRange) {
            req.error(500, 'Number range configuration not found');
        }
        const currentYear = new Date().getFullYear();
        if (numberRange.year !== currentYear) {
            numberRange.year = currentYear;
            numberRange.currentNumber = numberRange.startNumber - 1;
        }
        numberRange.currentNumber++;
        const sequence = String(numberRange.currentNumber).padStart(5, '0');
        const requestNo = `${numberRange.prefix}${numberRange.year}${sequence}`;
        req.data.requestNo = requestNo;
        await UPDATE(NumberRanges).set({ currentNumber: numberRange.currentNumber }).where({ object: 'PR' });
    })
})