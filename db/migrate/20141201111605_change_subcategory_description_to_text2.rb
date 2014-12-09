class ChangeSubcategoryDescriptionToText2 < ActiveRecord::Migration
  def change
  	  	add_column :subcategories, :description, :text
  end
end
