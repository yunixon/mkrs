class ChangeSubcategoryDescriptionToText < ActiveRecord::Migration
  def change
  	remove_column :subcategories, :description
  end
end
