Feature: In application listing we should see a link to the latest build
  In order to easily access the latest build of any of my apps
  As a developer
  I want a link to the latest build on the application listing page

  Background: 
    Given I am logged in
    And   I have an organization named "SmartLogic Solutions"
    And   the organization named "SmartLogic Solutions" has the app "Mollie's Fund"
    And   I am on the home page

  Scenario: Downloading the latest build of an app from the application listing
    Given the existing app "Mollie's Fund" has the build "TestBinary.ipa"
    And   I follow "My Organizations"
    And   I follow "SmartLogic Solutions"
    And   I follow "Latest Build"
    Then  the response should be the file "TestBinary.ipa"

  Scenario: Seeing "No Builds" next to app in application listing when it doesn't have any builds
    When  I follow "My Organizations"
    And   I follow "SmartLogic Solutions"
    Then  I should see "No Builds"
