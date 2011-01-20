Feature: User can download a build of an application
  In order to get a useful build of an application
  As a user
  I want download a build of an application

  Scenario: User downloads a build of a file
    Given the existing user:
      | email | test@slsdev.net |
    And   I am logged in
    And   the new app "Mollie's Fund" has the build "TestBinary.ipa"
    When  I go to the homepage
    And   I follow "All Applications"
    And   I follow "Mollie's Fund"
    And   I follow "Download latest build"
    Then  the response should be the file "TestBinary.ipa"
