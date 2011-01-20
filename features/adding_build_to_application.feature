Feature: Adding a build to an application
  In order to deliver app goodness to my customers
  As a developer
  I want to add builds to an application

  Background:
    Given I am logged in
    And   I have an organization named "SmartLogic Solutions"
    And   the organization named "SmartLogic Solutions" has the app "Mollie's Fund"
    And   I am on the home page
    And   I follow "My Organizations"
    And   I follow "SmartLogic Solutions"
    And   I follow "Add Build"

  Scenario: Adding a build to an application from the application index
    When  I attach the bundle "TestBinary.ipa"
    And   I press "Add Build"
    Then  I should see "Build Added!"

  Scenario: Adding a build to an application w/o a file attachment
    When  I press "Add Build"
    Then  I should see "You must attach an iOS bundle"
