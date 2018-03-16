class AddForeignKeyToOrderedItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :ordered_items, :item, null: false, foreign_key: true
  end
end
