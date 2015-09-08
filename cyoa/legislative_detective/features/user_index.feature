Feature: User index page

  As a User
  I want to see a list of users
  So I can see who has registered

  Scenario: User listed on index page
    Given I am signed in
    When I visit the user index page
    Then I see my own email address

