class RemoveListingColumns < ActiveRecord::Migration
  def change
  	remove_column :listings, :image_file_name
  	remove_column :listings, :image_content_type
  	remove_column :listings, :image_file_size
  	remove_column :listings, :image_updated_at
  end
end
