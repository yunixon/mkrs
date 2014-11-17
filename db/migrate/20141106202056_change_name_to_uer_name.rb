class ChangeNameToUerName < ActiveRecord::Migration
  def change
  	rename_column :users, :name, :user_name
  end
end
