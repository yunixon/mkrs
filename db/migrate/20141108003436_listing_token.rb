class ListingToken < ActiveRecord::Migration
  def change
  	  	add_column :photos, :listing_token, :string

  end
end
