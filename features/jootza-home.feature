Feature: As a jootza customer, I want to be able to navigate to landing page so that I can view product information

  @jootza @jootzaLanding1
  Scenario: Customer is displayed with jootza.com landing page
    Given I am on the Jootza portal
    When I click on LoginButton
    Then I should see LoginHeader

  @jootza @jootzaRegister
  Scenario: Customer is displayed with jootza.com landing page
    Given I am on the Jootza portal
    When I click on RegisterButton
    Then I should see RegisterHeader

  @jootza @jootzaOpenAccount
  Scenario: Customer is able to Click to Open Account
    Given I am on the Jootza portal
    When I click to OpenAccountButton
    Then I should see CustomerRegistrationHeader

  @jootza @jootzaSubscribe
  Scenario: Customer is displayed with jootza.com landing page
    Given I am on the Jootza portal
    When I scroll to "Subscribe"
    When I click on "Subscribe"
    Then I should see "invalidEmailMessage"

  @jootza @jootzaStartNow
  Scenario: Customer is displayed with jootza.com landing page
    Given I am on the Jootza portal
    When I scroll to "StarterPlan"
    When I click on "StartNow"
    Then I should see "CustomerSignup"