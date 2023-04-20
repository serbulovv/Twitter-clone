class AddNewFieldsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :bio, :string
    add_column :users, :location, :string
  end
end
