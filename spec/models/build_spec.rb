require 'spec_helper'

describe Build, "Generating metadata from upload" do
  setup do
    app = Factory(:valid_app)
    subject {Factory(:build_with_binary, :app => app)}
  end
  
  it "should have a version number"

  it "should have an app identifier"
end
