Feature: As a parabank customer, I want to be able to navigate to landing page so that I can login

    @parabankLogin @paraLoginFieldsPresent
    Scenario: Customer is able to see the login fields in parabank landing page
        Given I am on the "Parabank" website
        Then I should see "usernamefield"
        And I should see "passwordfield"
        And I should see "loginbutton"

    @parabankLogin @parabankValidCredential
    Scenario Outline: Customer is displayed with parabank landing page to login and view account
        Given I am on the "Parabank" website
        When I enter "username" as "<username>"
        And I enter "password" as "<password>"
        And I click on "ParaLoginButton"
        Then I should see "AccountOverview"
        Examples:
            | username | password |
            | peterp   | Demo123  |
            | jsmith   | Pass123  |

    @parabankLogin @parabankBlankLogin
    Scenario: Customer is displayed with parabank landing page to login
        Given I am on the "Parabank" website
        When I enter "username" as ""
        And I enter "password" as ""
        And I click on "ParaLoginButton"
        Then I should see "BlankErrorMessage"

    @parabankForgotLogin @parabankFoundCustomer
    Scenario: Customer is displayed Customer Lookup when login is forgotten
        Given I am on the "Parabank" website
        When I click on "ForgotLogin"
        Then I should see "CustomerLookup"

    @parabankForgotLogin @parabankValidCustomerLookup
    Scenario: Customer is displayed Customer Lookup to fill-in when login is forgotten
        Given I am on the "Parabank" website
        When I click on "ForgotLogin"
        And I enter the inputs for Lookup
            | inputName | inputValue   |
            | firstName | Peter        |
            | lastName  | Pan          |
            | street    | 123 North St |
            | city      | New York     |
            | state     | NY           |
            | zipCode   | 12345        |
            | ssn       | 123-45-6789  |

        And I click on "FindButton"
        Then I should see "CustomerFoundMsg"

    @parabankForgotLogin @parabankInvalidCustomerLookup
    Scenario: Customer is displayed Customer Lookup to fill-in when login is forgotten
        Given I am on the "Parabank" website
        When I click on "ForgotLogin"
        And I enter the inputs for Lookup
            | inputName | inputValue   |
            | firstName | aaa          |
            | lastName  | bbb          |
            | street    | 321 South St |
            | city      | Miami        |
            | state     | FL           |
            | zipCode   | 54321        |
            | ssn       | 555555555    |
        # | inputName | inputValue   |
        # | firstName | Bob          |
        # | lastName  | Doe          |
        # | street    | 321 South St |
        # | city      | Miami        |
        # | state     | FL           |
        # | zipCode   | 54321        |
        # | ssn       | 987-65-4321  |

        And I click on "FindButton"
        Then I should see "CustomerNotFoundMsg"

    @parabankForgotLogin @parabankBlankCustomerLookup
    Scenario: Customer is displayed Customer Lookup to fill-in when login is forgotten
        Given I am on the "Parabank" website
        When I click on "ForgotLogin"
        And I enter the inputs for Lookup
            | inputName | inputValue |
            | firstName |            |
            | lastName  |            |
            | street    |            |
            | city      |            |
            | state     |            |
            | zipCode   |            |
            | ssn       |            |

        And I click on "FindButton"
        Then I should see "firstNameNotFoundError"
        And I should see "lastNameNotFoundError"
        And I should see "streetNotFoundError"
        And I should see "cityNotFoundError"
        And I should see "stateNotFoundError"
        And I should see "zipCodeNotFoundError"
        And I should see "ssnNotFoundError"

    @parabankRegister @parabankLoadRegister
    Scenario: Page loads to register a new user
        Given I am on the "Parabank" website
        When I click on "Register"
        Then I should see "SignUp"

    @parabankRegister @parabankRegisterForm
    Scenario: Register a new user with valid information
        Given I am on the "Parabank" website
        When I click on "Register"
        And I enter the inputs for registration
            | inputName               | inputValue   |
            | customerFirstName       | Mike         |
            | customerLastName        | Jack         |
            | customerStreet          | 222 East St  |
            | customerCity            | Chicago      |
            | customerState           | IL           |
            | customerZipCode         | 55555        |
            | customerPhone           | 222-333-4444 |
            | customerSsn             | 222-33-4444  |
            | customerUsername        | mjack        |
            | customerPassword        | pass123      |
            | customerConfirmPassword | pass123      |
        And I click on "RegisterButton"
        Then I should see "RegisterSuccess"

    @parabankRegister @parabankExistingCustomer
    Scenario: Register an existing user with valid information
        Given I am on the "Parabank" website
        When I click on "Register"
        And I enter the inputs for registration
            | inputName               | inputValue   |
            | customerFirstName       | Mike         |
            | customerLastName        | Jack         |
            | customerStreet          | 222 East St  |
            | customerCity            | Chicago      |
            | customerState           | IL           |
            | customerZipCode         | 55555        |
            | customerPhone           | 222-333-4444 |
            | customerSsn             | 222-33-4444  |
            | customerUsername        | mjack        |
            | customerPassword        | pass123      |
            | customerConfirmPassword | pass123      |
        And I click on "RegisterButton"
        Then I should see "AlreadyExistsError"

    @parabankRegister @parabankPasswordMismatchRegister
    Scenario: Register an existing user with valid information
        Given I am on the "Parabank" website
        When I click on "Register"
        And I enter the inputs for registration
            | inputName               | inputValue   |
            | customerFirstName       | Mike         |
            | customerLastName        | Jack         |
            | customerStreet          | 222 East St  |
            | customerCity            | Chicago      |
            | customerState           | IL           |
            | customerZipCode         | 55555        |
            | customerPhone           | 222-333-4444 |
            | customerSsn             | 222-33-4444  |
            | customerUsername        | mjack2       |
            | customerPassword        | pass123      |
            | customerConfirmPassword | pass1234     |
        And I click on "RegisterButton"
        Then I should see "PasswordMismatchError"

    @parabankRegister @parabankBlankRegister
    Scenario: Register a user with blank data
        Given I am on the "Parabank" website
        When I click on "Register"
        And I enter the inputs for registration
            | inputName               | inputValue |
            | customerFirstName       |            |
            | customerLastName        |            |
            | customerStreet          |            |
            | customerCity            |            |
            | customerState           |            |
            | customerZipCode         |            |
            | customerPhone           |            |
            | customerSsn             |            |
            | customerUsername        |            |
            | customerPassword        |            |
            | customerConfirmPassword |            |
        And I click on "RegisterButton"
        Then I should see "customerFirstNameRequired"
        And I should see "customerLastNameRequired"
        And I should see "customerStreetRequired"
        And I should see "customerCityRequired"
        And I should see "customerStateRequired"
        And I should see "customerZipCodeRequired"
        And I should see "customerSsnRequired"
        And I should see "customerUsernameRequired"
        And I should see "customerPasswordRequired"
        And I should see "customerPasswordConfirmRequired"



