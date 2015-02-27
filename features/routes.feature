Feature: Test that basic app routes are responding to requests
    In order to verify the app is working as expected
    As the app owner
    I want to verify the web pages load correctly

  Scenario: Home Page
    Given I am on the homepage
    Then I should see "Laravel"

  Scenario: Registration page
    Given I am on "auth/register"
    Then I should see "Register"

  Scenario: Login page
    Given I am on "auth/login"
    Then I should see "Login"
    And I should be on "auth/login"

  Scenario: Login required for "home" page
    Given I am on "home"
    Then I should see "Login"
    And I should be on "auth/login"
