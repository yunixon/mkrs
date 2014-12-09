class CreateSubcategories < ActiveRecord::Migration
  def change
    create_table :subcategories do |t|
      t.string :category_id
      t.string :name
      t.string :description
      t.timestamps
    end
  end
end
