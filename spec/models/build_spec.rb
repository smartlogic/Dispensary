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

  def build_bad_factory(filename)
    file = File.open(Rails.root.join("spec", "fixtures", filename))
    build = Factory.build(:build, :bundle => file)
    file.close
    build
  end

  it "should fail when the plist is corrupt" do
    binary = build_bad_factory("BadBinaryCorruptPlist.ipa")
    binary.should_not be_valid
  end

  it "should fail when there is no plist" do
    binary = build_bad_factory("BadBinaryNoPlist.ipa")
    binary.should_not be_valid
  end

  it "should fail when there is no bundle inside the ipa" do
    binary = build_bad_factory("BadBinaryNoBundle.ipa")
    binary.should_not be_valid
  end

  it "should fail when there is no bundle identifier in the plist" do
    binary = build_bad_factory("BadBinaryNoBundleIdentifierInPlist.ipa")
    binary.should_not be_valid
  end

  it "should fail when the ipa is not a zip file" do
    binary = build_bad_factory("BadBinaryNotAZip.ipa")
    binary.should_not be_valid
  end
end
