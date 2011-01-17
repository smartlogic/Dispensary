class Build < ActiveRecord::Base
  has_attached_file :binary
  belongs_to :app
end
