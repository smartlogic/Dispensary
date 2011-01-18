Feature: User authentication
  In order to keep the riffraff out of our app
  As a site admin
  I want to allow users to register, login, and logout

  Scenario: Getting login form on homepage if not logged in
    Given I am not logged in
    When  I am on the home page
    Then  I should see "Sign In"
    And   I should not see "Sign Out"

  Scenario: Signing up as a new user
    Given I am on the home page
    And   I follow "Sign In"
    And   I follow "Sign up"
    When  I fill in "Email" with "test@slsdev.net"
    And   I fill in "Password" with "password"
    And   I fill in "Password confirmation" with "password"
    And   I press "Sign up"
    Then  I should see "You have signed up successfully"

  Scenario: Signing in as existing user
    Given the existing user:
      | email                 | test@slsdev.net |
      | password              | password        |
      | password_confirmation | password        |
    And   I am on the home page
    When  I follow "Sign In"
    And   I fill in "Email" with "test@slsdev.net"
    And   I fill in "Password" with "password"
    And   I press "Sign in"
    Then  I should see "Signed in successfully"

  Scenario: Signing out 
    Given the existing user:
      | email                 | test@slsdeve.net |
      | password              | password         |
      | password_confirmation | password         |
    And   I am logged in
    And   I am on the home page
    When  I follow "Sign Out"
    Then  I should see "Signed out successfully"
