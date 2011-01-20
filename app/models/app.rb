class App < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true
  has_many :builds
  belongs_to :organization

  def latest_build
    builds.last
  end
end
