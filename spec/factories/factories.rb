Factory.define :app do |f|
  f.sequence(:name)
end

Factory.define :user do |f|
  f.sequence(:email) {|n| "FrankieUser_#{n}@slsdev.net"}
  f.password  "password"
  f.password_confirmation "password"
end
