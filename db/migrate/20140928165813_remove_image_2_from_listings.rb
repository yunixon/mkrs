class RemoveImage2FromListings < ActiveRecord::Migration
  def change
    remove_column :listings, :image_2, :string
    remove_column :listings, :image_1, :string
  end
end
