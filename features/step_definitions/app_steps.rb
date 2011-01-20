Given /^the app "([^"]*)"$/ do |name|
  Factory(:app, :name => name)
end

Given /^the app "([^"]*)" for the organization "([^"]*)"$/ do |name, org_name|
  org = Organization.find_by_name(org_name)
  Factory(:app, :name => name, :organization => org)
end

Given /^the new app "([^"]*)" has the build "([^"]*)"$/ do |app_name, build_name|
  steps %Q{
    Given the app "#{app_name}"
    And   the existing app "#{app_name}" has the build "#{build_name}"
  }
end

Given /^the new app "([^"]*)" for the organization "([^"]*)" has the build "([^"]*)"$/ do |app_name, org_name, build_name|
  steps %Q{
    Given the app "#{app_name}" for the organization "#{org_name}"
    And   the existing app "#{app_name}" has the build "#{build_name}"
  }
end

Given /^the existing app "([^"]*)" has the build "([^"]*)"$/ do |app_name, build_name|
  app = App.find_by_name(app_name)
  org = app.organization
  steps %Q{
    When I go to the homepage
    And  I follow "My Organizations"
    And  I follow "#{org.name}"
    And I follow "Add Build"
    And I attach the bundle "#{build_name}"
    And I press "Add Build" 
    And I go to the homepage
  }
end
