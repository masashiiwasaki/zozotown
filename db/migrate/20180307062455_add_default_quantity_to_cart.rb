class AddDefaultQuantityToCart < ActiveRecord::Migration[5.0]
  def change
    change_column :carts, :quantity, :integer, :default => 0
  end
end
