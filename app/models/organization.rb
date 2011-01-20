class Organization < ActiveRecord::Base
  validates :name, :presence => true

  belongs_to :owner, :class_name => "User"
  has_many :apps
end
