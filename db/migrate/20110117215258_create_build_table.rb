class CreateBuildTable < ActiveRecord::Migration
  def self.up
    create_table :builds do |t|
      t.string :binary_file_name
      t.string :binary_content_type
      t.integer :binary_file_size
      t.datetime :binary_updated_at
      t.string :version
      t.references :application
    end
  end

  def self.down
    drop_table :builds
  end
end
