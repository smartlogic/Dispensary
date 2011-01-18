Feature: Viewing an application
  In order to know the details of an app
  As a developer
  I want to be able to view an application

  Background: 
    Given the existing user: 
      | email | test@slsdev.net |
    And   I am logged in

  Scenario: Viewing an application
    Given I am on the homepage
    And   the app "Mollie's Fund"
    When  I follow "All Applications"
    And   I follow "Mollie's Fund"
    Then  I should see "Application: Mollie's Fund"

  Scenario: Seeing a list of an application's builds
    Given I am on the homepage
    And   the new app "Mollie's Fund" has the build "TestBuild.ipa"
    And   the existing app "Mollie's Fund" has the build "TestBuild2.ipa"
    And   I am on the homepage
    When  I follow "All Applications"
    And   I follow "Mollie's Fund"
    Then  I should see "TestBuild2.ipa"
    And   I should see "TestBuild.ipa"

  Scenario: Adding a build
    Given I am on the homepage
    And   the app "Mollie's Fund"
    When  I follow "All Applications"
    And   I follow "Mollie's Fund"
    Then  I should see "Add Build"
    When  I follow "Add Build"
    Then  I should see "Binary"
