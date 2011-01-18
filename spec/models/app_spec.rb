require 'spec_helper'

describe App, 'validations' do
  context "without a name set" do
    it "should not be valid" do
      Factory.build(:app).should_not be_valid
    end
  end

  context "with a pre-existing app with the same name" do
    it "should not be valid" do
      Factory(:app, :name => "Name")
      Factory.build(:app, :name => "Name").should_not be_valid
    end
  end
end
