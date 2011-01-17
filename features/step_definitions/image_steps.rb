When /^I attach the bundle "([^"]+)"$/ do |name|
  When %{I attach the file "#{Rails.root.join('spec', 'fixtures', name)}" to "build[binary]"}
end

