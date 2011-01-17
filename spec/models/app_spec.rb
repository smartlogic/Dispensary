require 'spec_helper'

describe App, 'validations' do
  context "without a name set" do
    subject {App.new}
    it {should_not be_valid}
  end

  context "with a pre-existing app" do
    App.create :name => "Name"
    subject {App.new(:name => "Name")}
    it {should_not be_valid}
  end
end
