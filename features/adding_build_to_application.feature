Feature: Adding a build to an application
  In order to deliver app goodness to my customers
  As a developer
  I want to add builds to an application

  Scenario: Adding a build to an application from the application index
    Given I am on the home page
    And   the app "Mollie's Fund"
    When  I follow "All Applications"
    And   I follow "Add Build"
    And   I attach the bundle "TestBuild.ipa"
    And   I press "Add Build"
    Then  I should see "Build Added!"

  Scenario: Adding a build to an application w/o a file attachment
