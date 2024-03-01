const { assert } = require("chai");
const helpers = require("../runtime/helpers");

/* eslint-disable no-undef */
module.exports = {
    Parabank: 'https://parabank.parasoft.com/parabank/index.htm', 

    elements: {
        usernamefield: '//*[@id="loginPanel"]/form/p[1]/b',
        passwordfield: '//*[@id="loginPanel"]/form/p[2]',
        loginbutton: '//*[@id="loginPanel"]/form/div[3]/input',
        username: by.name('username'),
        password: by.name('password'),
        
        firstName: by.name('firstName'),
        lastName: by.name('lastName'),
        street: by.name('address.street'),
        city: by.name('address.city'),
        state: by.name('address.state'),
        zipCode: by.name('address.zipCode'),
        ssn: by.name('ssn'),

        ParaLoginButton: '//*[@id="loginPanel"]/form/div[3]/input',
        AccountOverview: '//*[@id="rightPanel"]/div/div',
        BlankErrorMessage: '//*[@id="rightPanel"]',

        ForgotLogin: '//*[@id="loginPanel"]/p[1]/a',
        CustomerLookup: '//*[@id="rightPanel"]',
        FindButton: '//*[@id="lookupForm"]/table/tbody/tr[8]/td[2]/input', 
        CustomerFoundMsg: '//*[@id="rightPanel"]', 
        CustomerNotFoundMsg: '//div[@id="rightPanel"]/p[@class="error"]',
       
        firstNameNotFoundError: '//*[@id="firstName.errors"]',
        lastNameNotFoundError: '//*[@id="lastName.errors"]',
        streetNotFoundError: '//*[@id="address.street.errors"]',
        cityNotFoundError: '//*[@id="address.city.errors"]',
        stateNotFoundError: '//*[@id="address.state.errors"]',
        zipCodeNotFoundError: '//*[@id="address.zipCode.errors"]',
        ssnNotFoundError: '//*[@id="ssn.errors"]',

        customerFirstName: by.name('customer.firstName'),
        customerLastName: by.name('customer.lastName'),
        customerStreet: by.name('customer.address.street'),
        customerCity: by.name('customer.address.city'),
        customerState: by.name('customer.address.state'),
        customerZipCode: by.name('customer.address.zipCode'),
        customerPhone: by.name('customer.phoneNumber'),
        customerSsn: by.name('customer.ssn'),
        customerUsername: by.name('customer.username'),
        customerPassword: by.name('customer.password'),
        customerConfirmPassword: by.name('repeatedPassword'),

        Register: '//*[@id="loginPanel"]/p[2]/a', 
        SignUp: '//*[@id="rightPanel"]',
        RegisterButton: '//*[@id="customerForm"]/table/tbody/tr[13]/td[2]/input',
        RegisterSuccess: '//*[@id="rightPanel"]/h1[@class="title"]',
        AlreadyExistsError: '//*[@id="customer.username.errors"]', 
        PasswordMismatchError: '//*[@id="repeatedPassword.errors"]',

        customerFirstNameRequired: '//*[@id="customer.firstName.errors"]',
        customerLastNameRequired: '//*[@id="customer.lastName.errors"]',
        customerStreetRequired: '//*[@id="customer.address.street.errors"]',
        customerCityRequired: '//*[@id="customer.address.city.errors"]',
        customerStateRequired: '//*[@id="customer.address.state.errors"]',
        customerZipCodeRequired: '//*[@id="customer.address.zipCode.errors"]',
        customerSsnRequired: '//*[@id="customer.ssn.errors"]',
        customerUsernameRequired: '//*[@id="customer.username.errors"]',
        customerPasswordRequired: '//*[@id="customer.password.errors"]',
        customerPasswordConfirmRequired: '//*[@id="repeatedPassword.errors"]',
    },

    clickElement: async function (objectKey) {
        // eslint-disable-next-line no-console
        const selector = this.elements[objectKey];
        await driver.sleep(3000);
        return driver.findElement(By.xpath(selector)).click();
    },

    inputElement: async function (inputName, inputValue) {
        const selector = this.elements[inputName];
        await driver.sleep(3000);
        return driver.findElement(selector).sendKeys(inputValue);

    },

    elementExists: async function (objectKey) {
        // eslint-disable-next-line no-console
        const selector = this.elements[objectKey];
        await driver.sleep(1000);
        return driver.findElement(By.xpath(selector));
    },
};