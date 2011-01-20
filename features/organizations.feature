Feature: Organizations
  In order to manage applications for various companies
  As a administrator
  I want to scope applications to organizations

  Scenario: Access to organizations from homepage
    Given I am logged in
    When  I am on the homepage
    Then  I should see "My Organizations"

  Scenario: Creating a new organization
    Given I am logged in
    And   I am on the homepage
    And   I follow "My Organizations"
    And   I follow "Create new organization"
    When  I fill in "Name" with "SmartLogic Solutions"
    And   I press "Create organization"
    Then  I should see "Successfully created organization"

  Scenario: Creating a organization without a name
    Given I am logged in
    And   I am on the homepage
    And   I follow "My Organizations"
    And   I follow "Create new organization"
    When  I press "Create organization"
    Then  I should see "Name can't be blank"

  Scenario: Viewing my created organizations
    Given I am logged in 
    And   I am on the homepage
    And   I follow "My Organizations"
    And   I follow "Create new organization"
    And   I fill in "Name" with "SmartLogic Solutions"
    And   I press "Create organization"
    And   I am on the homepage
    When  I follow "My Organizations"
    Then  I should see "SmartLogic Solutions"
