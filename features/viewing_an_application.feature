Feature: Viewing an application
  In order to know the details of an app
  As a developer
  I want to be able to view an application

  Background: 
    Given I am logged in
    And   I have an organization named "SmartLogic Solutions"

  Scenario: Viewing an application
    Given I am on the homepage
    And   the app "Mollie's Fund" for the organization "SmartLogic Solutions"
    And   I follow "My Organizations"
    And   I follow "SmartLogic Solutions"
    And   I follow "Mollie's Fund"
    Then  I should see "Application: Mollie's Fund"

  Scenario: Seeing a list of an application's builds
    Given I am on the homepage
    And   the new app "Mollie's Fund" for the organization "SmartLogic Solutions" has the build "TestBinary.ipa"
    And   the existing app "Mollie's Fund" has the build "TestBinary2.ipa"
    And   I follow "My Organizations"
    And   I follow "SmartLogic Solutions"
    And   I follow "Mollie's Fund"
    Then  I should see "TestBinary.ipa"
    And   I should see "TestBinary2.ipa"

  Scenario: Adding a build
    Given I am on the homepage
    And   the app "Mollie's Fund" for the organization "SmartLogic Solutions"
    And   I follow "My Organizations"
    And   I follow "SmartLogic Solutions"
    And   I follow "Mollie's Fund"
    Then  I should see "Add Build"
    When  I follow "Add Build"
    Then  I should see "Binary"

  Scenario: Viewing applications w/o having any
    Given I am on the homepage
    And   I follow "My Organizations"
    When  I follow "SmartLogic Solutions"
    Then  I should see "No Applications"
    And   I should see "Create New Application"

  Scenario: Viewing applications w/ a bunch
    Given I am on the homepage
    And   the app "Mollie's Fund" for the organization "SmartLogic Solutions"
    And   the app "Meguiar's" for the organization "SmartLogic Solutions"
    When  I follow "My Organizations"
    And   I follow "SmartLogic Solutions"
    Then  I should see "Mollie's Fund"
    And   I should see "Meguiar's"
    And   I should see "Create New Application"
