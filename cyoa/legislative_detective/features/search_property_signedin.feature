Feature: Search Property as a signed in User

  As a User who has signed into the application
  I want to be able to search an address
  so I can learn more about the property

  Scenario: Search Property
    Given I am a signed in user
    When I click search properties on the home page
    Then I see any applicable listing
