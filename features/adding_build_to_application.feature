Feature: Adding a build to an application
  In order to deliver app goodness to my customers
  As a developer
  I want to add builds to an application

  Background:
    Given the existing user:
      | email | test@slsdev.net |
    And   I am logged in
    And   I am on the home page
    And   the app "Mollie's Fund"
    When  I follow "All Applications"
    And   I follow "Add Build"

  Scenario: Adding a build to an application from the application index
    When  I attach the bundle "TestBinary.ipa"
    And   I press "Add Build"
    Then  I should see "Build Added!"
    And   I should see "Application: Mollie's Fund"

  Scenario: Adding a build to an application w/o a file attachment
    When  I press "Add Build"
    Then  I should see "You must attach a file"
