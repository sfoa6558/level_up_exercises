Feature: Sign in

  As a User
  I want to sign in
  So I can visit protected areas of the site

  Scenario: User cannot sign in if not registered
    Given I do not exist as a user
    When I sign in with a username and password
    Then I see an invalid credentials message

  Scenario: User can sign in with valid credentials
    Given I exist as a user
    And I am not signed in
    When I sign in with valid credentials
    Then I see a success message

  Scenario:User cannot sign in with wrong email
    Given I exist as a user
    And I am not signed in
    When I sign in with the wrong email
    Then I see an invalid email message

  Scenario:User cannot sign in with wrong password
    Given I exist as a user
    And I am not signed in
    When I sign in with a wrong password
    Then I see an invalid password message



