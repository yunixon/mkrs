class ChangeColumnName < ActiveRecord::Migration
  def change
  	rename_column :listings, :image, :image_1
  end
end
