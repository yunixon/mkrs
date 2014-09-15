class AddAdditionFieldsToUsers < ActiveRecord::Migration
  def change
    	add_column :users, :location, :string
    	add_column :users, :age, :string
    	add_column :users, :bio, :string
  end
end
