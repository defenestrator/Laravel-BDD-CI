Feature: Membership
  In order to provide access to exclusive member content and features
  As the app owner
  I want registration and authentication for users

  Scenario: Registration
    When I register "TestMan" "test@example.com"
    Then I should have an account

  Scenario: Successful Authentication
    Given I have an account "TestMan" "test@example.com"
    When I sign in
    Then I should be logged in

  Scenario: Failed Authentication
    Given I am on "auth/login"
    When I sign in with invalid credentials
    Then I should not be logged in

  Scenario: Logout should redirect to homepage
    Given I sign in with invalid credentials
    When I go to "auth/logout"
    Then I should not be logged in
    And I should be on the homepage