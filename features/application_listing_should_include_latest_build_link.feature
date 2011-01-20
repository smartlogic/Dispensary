Feature: In application listing we should see a link to the latest build
  In order to easily access the latest build of any of my apps
  As a developer
  I want a link to the latest build on the application listing page

  Background:
    Given the existing user:
      | email | test@slsdev.net |
    And   I am logged in

  Scenario: Downloading the latest build of an app from the application listing
    Given the new app "Mollie's Fund" has the build "TestBinary.ipa"
    When  I go to the homepage
    And   I follow "All Applications"
    And   I follow "Latest Build"
    Then  the response should be the file "TestBinary.ipa"

  Scenario: Seeing "No Builds" next to app in application listing when it doesn't have any builds
    Given the app "Mollie's Fund"
    When  I go to the homepage
    And   I follow "All Applications"
    Then  I should see "No Builds"
