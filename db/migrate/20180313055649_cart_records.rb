class CartRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :cart_records do |t|
      t.references :user,       null: false, foreign_key: true
      t.references :item_list,  null: false, foreign_key: true
      t.timestamps
    end
  end
end
