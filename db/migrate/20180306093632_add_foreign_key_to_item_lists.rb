class AddForeignKeyToItemLists < ActiveRecord::Migration[5.0]
  def change
    change_table :item_lists do |t|
      t.foreign_key :colors
      t.foreign_key :sizes
    end
  end
end
