Given /^the organization named "([^"]*)" has the app "([^"]*)"$/ do |org_name, app_name|
  org = Organization.find_by_name(org_name)
  org.apps.create(:name => app_name)
end
