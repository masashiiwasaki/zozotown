class CreateCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :carts do |t|
      t.references :user,      null: false, foreign_key: true
      t.references :item,      null: false
      t.references :color,     null: false
      t.references :size,      null: false
      t.integer    :quantity,  null: false
      t.timestamps
    end
  end
end
