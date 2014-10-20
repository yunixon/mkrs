class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
   		t.integer  "album_id"
	    t.string   "image"
	    t.datetime "created_at"
	    t.datetime "updated_at"
    end
  end
end
