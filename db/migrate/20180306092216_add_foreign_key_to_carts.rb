class AddForeignKeyToCarts < ActiveRecord::Migration[5.0]
  def change
    change_table :carts do |t|
      t.foreign_key :items
      t.foreign_key :colors
      t.foreign_key :sizes
    end
  end
end
