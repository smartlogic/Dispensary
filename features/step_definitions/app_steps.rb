Given /^the app "([^"]*)"$/ do |name|
  Factory(:app, :name => name)
end

Given /^the new app "([^"]*)" has the build "([^"]*)"$/ do |app_name, build_name|
  steps %Q{
    Given the app "#{app_name}"
    And   the existing app "#{app_name}" has the build "#{build_name}"
  }
end

Given /^the existing app "([^"]*)" has the build "([^"]*)"$/ do |app_name, build_name|
  steps %Q{
    When I go to the homepage
    And I follow "All Applications"
    And I follow "Add Build"
    And I attach the bundle "#{build_name}"
    And I press "Add Build" 
  }
end
