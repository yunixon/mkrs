class AddSlugCategoriesAndSubCat < ActiveRecord::Migration
  def change
  	add_column :categories, :slug, :string
    add_index :categories, :slug, :unique => true

    add_column :subcategories, :slug, :string
    add_index :subcategories, :slug, :unique => true
  end
end
