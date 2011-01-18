class Build < ActiveRecord::Base
  has_attached_file :binary
  belongs_to :app

  validates_attachment_presence :binary, :message => "You must attach a file to include."
end
