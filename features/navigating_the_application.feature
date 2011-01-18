Feature: Navigating the application
  In order to manage my apps
  As a developer
  I want to be able to go between the parts of the application

  Background:
    Given the existing user:
      | email | test@slsdev.net |
    And   I am logged in
    And   the app "Mollie's Fund"
    And   the app "PPA"
    And   I am on the homepage
    And   I follow "All Applications"

  Scenario:
    When I follow "PPA"
    And I follow "Apps" within "header"
    Then I should be on the apps page

