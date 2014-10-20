class RemoveImage < ActiveRecord::Migration
  def change
  	remove_column	:image, :listings
  end
end
