class RemoveToken < ActiveRecord::Migration
  def change
  	remove_column :listings, :token
  	remove_column :photos, :listing_token
  end
end
