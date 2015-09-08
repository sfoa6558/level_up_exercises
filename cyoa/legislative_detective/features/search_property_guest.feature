Feature: Search Property as a guest

  As a guest who is trying to search a property
  I want to be able to search an address
  so I can learn more about the property

  Scenario: Search Property
    Given I am not a registered user
    When I click search properties on the home page
    Then I am redirected to create an account
