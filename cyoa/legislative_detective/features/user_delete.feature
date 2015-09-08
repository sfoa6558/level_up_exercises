Feature: User delete

  As a User
  I want to delete my user profile
  So I can close my account

  Scenario: User can delete own account
    Given I am signed in
    When I delete my account
    Then I should see an account deleted message

