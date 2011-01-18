Given /^I am not logged in$/ do
  visit destroy_user_session_path
end

Given /^the existing user:$/ do |table|
  custom_attributes = {}
  table.raw.each do |row|
    custom_attributes[row[0]] = row[1]
  end
  @user = Factory(:user, custom_attributes)
end

Given /^I am logged in$/ do
  steps %Q{
    Given I am on the homepage
    And   I follow "Sign In"
    And   I fill in "Email" with "#{@user.email}"
    And   I fill in "Password" with "#{@user.password}"
    And   I press "Sign in"
  }
end
