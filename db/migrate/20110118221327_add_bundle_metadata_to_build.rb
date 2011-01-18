class AddBundleMetadataToBuild < ActiveRecord::Migration
  def self.up
    change_table :builds do |t|
      t.string :display_name
      t.string :version_number
      t.string :bundle_identifier
    end
  end

  def self.down
    remove_column :builds, :display_name
    remove_column :builds, :version_number
    remove_column :builds, :bundle_identifier
  end
end
