class AddListingEditToListings < ActiveRecord::Migration
  def change
  	add_column :listings, :exchangeable, :boolean, :default => false
  end
end
