class AddImageToCategories < ActiveRecord::Migration
  def change
  	add_column :categories, :hero_image, :string
  end
end
