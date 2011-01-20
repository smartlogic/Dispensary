Feature: Organizations
  In order to manage applications for various companies
  As a administrator
  I want to scope applications to organizations

  Scenario: Access to new organization from homepage
    Given I am logged in
    When  I am on the homepage
    Then  I should see "Create new organization"

  Scenario: Creating a new organization
    Given I am logged in
    And   I am on the homepage
    And   I follow "Create new organization"
    When  I fill in "Name" with "SmartLogic Solutions"
    And   I press "Create organization"
    Then  I should see "Successfully created organization"

  Scenario: Creating a organization without a name
    Given I am logged in
    And   I am on the homepage
    And   I follow "Create new organization"
    When  I press "Create organization"
    Then  I should see "Name can't be blank"
