Factory.define :app do |f|
end

Factory.define :valid_app, :parent => :app do |f|
  f.sequence(:name) {|n| "#{ActiveSupport::Inflector.ordinalize(n)} App" }
end

Factory.define :build do |f|
  f.association :app, :factory => :valid_app
  f.bundle File.new(Rails.root.join('spec', 'fixtures', 'TestBinary.ipa'))
end

Factory.define :user do |f|
  f.sequence(:email) {|n| "FrankieUser_#{n}@slsdev.net"}
  f.password  "password"
  f.password_confirmation "password"
end
