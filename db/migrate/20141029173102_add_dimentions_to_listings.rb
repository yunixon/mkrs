class AddDimentionsToListings < ActiveRecord::Migration
  def change
  	  	add_column :listings, :dimentions, :string
  end
end
