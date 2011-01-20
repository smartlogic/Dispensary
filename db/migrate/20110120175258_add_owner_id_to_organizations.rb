class AddOwnerIdToOrganizations < ActiveRecord::Migration
  def self.up
    add_column :organizations, :owner_id, :integer
  end

  def self.down
    remove_column :organizations, :owner_id
  end
end
