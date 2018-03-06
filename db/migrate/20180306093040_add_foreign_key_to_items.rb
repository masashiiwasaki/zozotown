class AddForeignKeyToItems < ActiveRecord::Migration[5.0]
  def change
    change_table :items do |t|
      t.foreign_key :shops
      t.foreign_key :brands
    end
  end
end
