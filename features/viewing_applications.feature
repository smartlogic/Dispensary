Feature: Viewing apps
  In order to know which apps I have
  As a developer
  I want to view a listing of all my apps

  Background: 
    Given the existing user:
      | email | test@slsdev.net |
    And   I am logged in

  Scenario: Viewing applications w/o having any
    Given I am on the homepage
    When  I follow "All Applications"
    Then  I should see "No Applications"
    And   I should see "Create New Application"

  Scenario: Viewing applications w/ a bunch
    Given I am on the homepage
    And   the app "Mollie's Fund"
    And   the app "Meguiar's"
    When  I follow "All Applications"
    Then  I should see "Mollie's Fund"
    And   I should see "Meguiar's"
