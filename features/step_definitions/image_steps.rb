When /^I attach the bundle "([^"]+)"$/ do |name|
  When %{I attach the file "#{Rails.root.join('spec', 'fixtures', name)}" to "build[bundle]"}
end

Then /^the response should be the file "([^"]+)"$/ do |name|
  file = File.open(Rails.root.join('spec', 'fixtures', name))
  content = file.read
  file.close
  page.body == content
end
