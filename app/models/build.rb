require 'carrierwave/orm/activerecord'

class Build < ActiveRecord::Base
  belongs_to :app
  mount_uploader :bundle, BundleUploader
  validates_presence_of :bundle, :message => "You must attach an iOS bundle"

end
