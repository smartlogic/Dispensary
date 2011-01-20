# encoding: utf-8

class BundleUploader < CarrierWave::Uploader::Base
  def s3_bucket
    'sls-appdepository-dev'
  end

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Process files as they are uploaded:
  process :extract_metadata

  def get_xml path
    if true # mac
      plutil = "plutil -convert xml1 -o - #{path}"
    else # linux
      plutil = "plutil-1.3 -v -i #{path} -o /dev/stout"
    end
    %x{#{plutil}}
  end

  def extract_metadata
    if model.version.nil?
      ipa = Zippy.open(model.bundle.path)

      plist_data = ipa[ipa.paths.grep(/\/Info.plist/).first]
      plist_path = Rails.root.join("tmp", model.bundle.path + ".plist")
      File.new(plist_path, 'wb').tap do |plist|
        plist.write(plist_data)
        plist.close
      end

      Plist::parse_xml(get_xml(plist_path)).tap do |data|
        model.update_attribute(:version, data["CFBundleVersion"])
        model.update_attribute(:display_name, data["CFBundleDisplayName"])
        model.update_attribute(:bundle_identifier, data["CFBundleIdentifier"])
      end
    end
  end

  # Add a white list of extensions which are allowed to be uploaded.
  def extension_white_list
    %w(ipa)
  end

  def filename
    File.basename(path)
  end
end
