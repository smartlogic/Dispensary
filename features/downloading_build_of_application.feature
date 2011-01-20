Feature: User can download a build of an application
  In order to get a useful build of an application
  As a user
  I want download a build of an application

  Scenario: User downloads a build of a file
    Given I am logged in
    And   I have an organization named "SmartLogic Solutions"
    And   the new app "Mollie's Fund" for the organization "SmartLogic Solutions" has the build "TestBinary.ipa"
    When  I go to the homepage
    And   I follow "My Organizations"
    And   I follow "SmartLogic Solutions"
    And   I follow "Mollie's Fund"
    And   I follow "Download latest build"
    Then  the response should be a binary
