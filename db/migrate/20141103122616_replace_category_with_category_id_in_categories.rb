class ReplaceCategoryWithCategoryIdInCategories < ActiveRecord::Migration
  def change
  	rename_column :listings, :category, :category_id
  end
end
