class AddSubcatoryToListings < ActiveRecord::Migration
  def change
  	  	add_column :listings, :subcategory_id, :string
  end
end
