class CreateItemLists < ActiveRecord::Migration[5.0]
  def change
    create_table :item_lists do |t|
      t.references :item,     null: false, foreign_key: true
      t.references :color,    null: false
      t.references :size,     null: false
      t.integer    :stock,    null: false
      t.timestamps
    end
  end
end
