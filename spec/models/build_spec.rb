require 'spec_helper'

describe Build, "Generating metadata from upload" do
  it "should have a version number" do
    binary = Factory(:build)
    binary.version.should == "1.0"
  end

  it "should have a bundle identifier" do
    binary = Factory(:build)
    binary.bundle_identifier.should == "com.sls.testbinary.ipad"
  end

  it "should have a bundle display name" do
    binary = Factory(:build)
    binary.display_name.should == "TestBinary"
  end

  # bundle display name: TestBinary
  # Executable file: TestBinaryFilename
  # Bundle identifier: com.sls.testbinary.ipad
  # Bundle name: TestBinaryBundle
  # Bundle version: 1.0

  it "should fail when the plist is corrupt"
  it "should fail when there is no plist"
  it "should fail when there is no bundle inside the ipa"
  it "should fail when there is no bundle identifier in the plist"
  it "should fail when the ipa is not a zip file"

end
