class RemoveForeignKeyToOrderedItems < ActiveRecord::Migration[5.0]
  def change
    remove_reference :ordered_items, :order,  null: false, foreign_key: true
  end
end
