Feature: A user wants to book flight tickets on make my trip website 
  @MakeMyTrip @flightSearch
  Scenario: When a user wants to book flight tickets
    Given I am on the MakeMyTrip website
    When I click on From dropwdown
    And I select chennai 
    And I click on To dropdown
    And I select Bengaluru
    And I click on departure date
    And I select dates
    And I click on Travellers & Class
    And I select 2 adults
    And I click on Apply button
    And I click on Search button
    Then I should see flight listing page

  @MakeMyTrip @flight-booking @timing
  Scenario: When a user wants to check flight availability
    Given I am on the MakeMyTrip flights page
    When I select the from flight
    And I select the to flight
    And I click on Book now button
    Then I should see the fare selection page
    When I click on Premium Economy
    And Click on Book Now button
    Then I should see the traveller details page

 @MakeMyTrip @loggedIn
  Scenario: When a user wants to book flight after logging in
    Given I am logged on into MakeMyTrip website
    When I click on From dropwdown
    When I click on my ticket link
    And I click on cancel ticket button
    Then I should see ticket cancelled message