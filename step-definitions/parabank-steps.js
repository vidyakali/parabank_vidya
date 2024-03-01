const helpers = require("../runtime/helpers");

module.exports = function () {

    this.Given(/^I am on the "([^"]*)" website$/, function (objectKey) {
        return helpers.loadPage(page.parabank[objectKey]);
    });

    this.When(/^I click on "([^"]*)"$/, function (objectKey) {
        console.log('The objectKey is ' + page.parabank[objectKey]);
        return page.parabank.clickElement(objectKey);
    });

    this.When(/^I enter "([^"]*)" as "([^"]*)"$/, function (objectKey, value) {
        return page.parabank.inputElement(objectKey, value);
    });

    this.Then(/^I should see "([^"]*)"$/, function (objectKey) {
        return page.parabank.elementExists(objectKey);
    });

    this.When(/^I enter the inputs for Lookup$/, async function (table) {
        const fields = table.rows();
        for (i = 0; i < fields.length; i++) {
            page.parabank.inputElement(fields[i][0], fields[i][1]);
        };
        await driver.sleep(3000);
        return;
    });

    this.When(/^I enter the inputs for registration$/,async function (table){
        const fields = table.rows();
        for (i = 0; i < fields.length; i++) {
            page.parabank.inputElement(fields[i][0], fields[i][1]);
        };
        await driver.sleep(3000);
        return;
        
    });

};