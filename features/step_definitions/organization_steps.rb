Given /^I have an organization named "([^"]*)"$/ do |org_name|
  Factory(:organization, :owner => @user, :name => org_name) 
end
