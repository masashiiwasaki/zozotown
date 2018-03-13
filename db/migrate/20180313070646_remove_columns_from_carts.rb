class RemoveColumnsFromCarts < ActiveRecord::Migration[5.0]
  def change
  remove_reference :carts, :item,  null: false, foreign_key: true
  remove_reference :carts, :color, null: false, foreign_key: true
  remove_reference :carts, :size,  null: false, foreign_key: true
  end
end
