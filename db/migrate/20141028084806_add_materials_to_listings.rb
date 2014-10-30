class AddMaterialsToListings < ActiveRecord::Migration
  def change
  	add_column :listings, :materials, :string
  end
end
