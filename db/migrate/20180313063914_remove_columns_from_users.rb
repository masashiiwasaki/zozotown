class RemoveColumnsFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :name, :string
    remove_column :users, :postcode, :integer
    remove_column :users, :address_main, :string
    remove_column :users, :address_sub, :string
    remove_column :users, :telephone_number, :integer
  end
end
