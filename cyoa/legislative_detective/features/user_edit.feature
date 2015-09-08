Feature: User edit

  As a User
  I want to edit my user profile
  So I can change my email address

  Scenario: User changes email address
    Given I am signed in
    When I change my email address
    Then I see an account updated message


  Scenario: User cannot edit another user's profile
    Given I am signed in
    When I try to edit another user's profile
    Then I see my own 'edit profile page'