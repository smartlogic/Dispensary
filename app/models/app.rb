class App < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true
  has_many :builds

  def latest_build
    builds.last
  end
end
