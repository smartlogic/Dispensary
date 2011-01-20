Feature: Creating a application
  In order to distribute debug builds of an iOS app
  As a developer
  I want to be able to create a new application

  Background:
    Given I am logged in
    And   I have an organization named "SmartLogic Solutions"
    And   I am on the homepage
    And   I follow "My Organizations"
    And   I follow "SmartLogic Solutions"
    And   I follow "Create New Application"

  Scenario: Viewing the new application form
    Then  I should see "Creating New Application"

  Scenario: Submitting the new application form with valid data
    When  I fill in "Name" with "Mollie's Fund iPad"
    And   I press "Create Application"
    Then  I should see "Successfully created Mollie's Fund iPad"

  Scenario: Submitting the new application form without a name
    When  I press "Create Application"
    Then  I should see "Name can't be blank"

  Scenario: Submitting the new application form with a duplicate name
    Given the app "Mollie's Fund iPad"
    When  I fill in "Name" with "Mollie's Fund iPad"
    And   I press "Create Application"
    Then  I should see "Name has already been taken" 
