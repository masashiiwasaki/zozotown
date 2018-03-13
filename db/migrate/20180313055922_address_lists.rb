class AddressLists < ActiveRecord::Migration[5.0]
  def change
    create_table :address_lists do |t|
      t.references :user,             null: false, foreign_key: true
      t.string     :name,             null: false
      t.integer    :postcode,         null: false
      t.string     :address_main,     null: false
      t.string     :address_sub
      t.integer    :telephone_number, null: false
      t.integer    :default_flag
      t.timestamps
    end
  end
end
