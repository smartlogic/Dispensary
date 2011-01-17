require 'spec_helper'

describe App, 'validations' do
  context "without a name set" do
    before :each do
      subject {Factory.build(:app)}
    end

    it {should_not be_valid}
  end

  context "with a pre-existing app" do
    before :each do
      Factory(:app, :name => "Name")
      subject {Factory.build(:app, :name => "Name")}
    end
    it {should_not be_valid}
  end
end
