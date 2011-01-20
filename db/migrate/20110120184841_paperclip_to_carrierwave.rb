class PaperclipToCarrierwave < ActiveRecord::Migration
  def self.up
    remove_column :builds, :binary_file_name
    remove_column :builds, :binary_content_type
    remove_column :builds, :binary_file_size
    remove_column :builds, :binary_updated_at

    add_column :builds, :bundle, :string
    add_column :builds, :created_at, :timestamp
  end

  def self.down
    remove_column :builds, :bundle
    remove_column :builds, :created_at


    add_column :builds, :binary_updated_at, :string
    add_column :builds, :binary_file_size, :integer
    add_column :builds, :binary_content_type, :string
    add_column :builds, :binary_file_name, :datetime
  end
end
