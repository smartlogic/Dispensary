class AddOrganizationIdToApps < ActiveRecord::Migration
  def self.up
    add_column :apps, :organization_id, :integer
  end

  def self.down
    remove_column :apps, :organization_id
  end
end
