class AddColumnToCarts < ActiveRecord::Migration[5.0]
  def change
    add_reference :carts, :item_list, null: false, foreign_key: true
  end
end
