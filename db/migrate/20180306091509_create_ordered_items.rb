class CreateOrderedItems < ActiveRecord::Migration[5.0]
  def change
    create_table :ordered_items do |t|
      t.references :order,    null: false, foreign_key: true
      t.references :item,     null: false, foreign_key: true
      t.references :color,    null: false, foreign_key: true
      t.references :size,     null: false, foreign_key: true
      t.integer    :quantity, null: false
      t.timestamps
    end
  end
end
