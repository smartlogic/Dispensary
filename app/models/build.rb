class Build < ActiveRecord::Base
  has_attached_file :binary
  belongs_to :app

  validates_attachment_presence :binary, :message => "You must attach a file to include."

  after_save :extract_metadata

  def get_xml path
    if true # mac
      plutil = "plutil -convert xml1 -o - #{path}"
    else # linux
      plutil = "plutil-1.3 -v -i #{path} -o /dev/stout"
    end
    %x{#{plutil}}
  end

  def extract_metadata
    if version.nil?
      ipa = Zippy.open(binary.path)
      plist_data = ipa[ipa.paths.grep(/\/Info.plist/).first]
      plist_path = binary.path + ".plist"
      plist = File.new(plist_path, 'wb')
      plist.write(plist_data)
      plist.close
      data = Plist::parse_xml(get_xml(plist_path))

      update_attribute(:version, data["CFBundleVersion"])
      update_attribute(:display_name, data["CFBundleDisplayName"])
      update_attribute(:bundle_identifier, data["CFBundleIdentifier"])
    end
  end
end
