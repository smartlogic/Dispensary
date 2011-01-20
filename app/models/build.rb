class Build < ActiveRecord::Base
  belongs_to :app
  mount_uploader :bundle, BundleUploader
  validates_presence_of :bundle, :message => "You must attach an iOS bundle"
  validates_length_of [:version, :display_name, :bundle_identifier], :minimum => 1,
    :too_short => "your bundle seems to be corrupt or missing data, please verify your project has been built correctly and try again"
end
