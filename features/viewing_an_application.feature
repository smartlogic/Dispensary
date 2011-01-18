Feature: Viewing an application
  In order to know the details of an app
  As a developer
  I want to be able to view an application

  Scenario: Viewing an application
    Given I am on the homepage
    And   the app "Mollie's Fund"
    When  I follow "All Applications"
    And   I follow "Mollie's Fund"
    Then  I should see "Application: Mollie's Fund"

  Scenario: Seeing a list of an application's builds

  Scenario: Adding a build
    Given I am on the homepage
    And   the app "Mollie's Fund"
    When  I follow "All Applications"
    And   I follow "Mollie's Fund"
    Then  I should see "Add Build"
    When  I follow "Add Build"
    Then  I should see "Binary"
