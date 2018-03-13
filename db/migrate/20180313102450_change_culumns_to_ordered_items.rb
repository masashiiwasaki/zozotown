class ChangeCulumnsToOrderedItems < ActiveRecord::Migration[5.0]
  def change
    add_column :ordered_items, :regular_price, :integer, null: false
    add_column :ordered_items, :item_name, :string, null: false
    add_column :ordered_items, :shop_name, :string, null: false
    add_column :ordered_items, :color, :string, null: false
    add_column :ordered_items, :size, :string, null: false
    remove_reference :ordered_items, :item,  null: false, foreign_key: true
    add_reference :ordered_items, :order_history, null: false, foreign_key: true
  end
end
