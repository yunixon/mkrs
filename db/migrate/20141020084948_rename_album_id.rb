class RenameAlbumId < ActiveRecord::Migration
  def change
  	rename_column :photos, :album_id, :listing_id
  end
end
