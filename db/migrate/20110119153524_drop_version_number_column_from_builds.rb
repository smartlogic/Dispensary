class DropVersionNumberColumnFromBuilds < ActiveRecord::Migration
  def self.up
    remove_column :builds, :version_number
  end

  def self.down
    add_column :builds, :version_number
  end
end
