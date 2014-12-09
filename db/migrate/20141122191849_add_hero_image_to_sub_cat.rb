class AddHeroImageToSubCat < ActiveRecord::Migration
  def change
  	  	add_column :subcategories, :hero_image, :string
  end
end
