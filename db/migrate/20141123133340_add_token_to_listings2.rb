class AddTokenToListings2 < ActiveRecord::Migration
  def change
  	  	add_column :listings, :token, :string
  	  	add_column :photos, :listing_token, :string
  end
end
