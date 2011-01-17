Given /^the app "([^"]*)"$/ do |name|
  Factory(:app, :name => name)
end
