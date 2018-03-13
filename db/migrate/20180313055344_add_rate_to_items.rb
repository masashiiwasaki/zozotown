class AddRateToItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :price,           :integer
    remove_column :items, :image_url,       :string
    add_column :items,    :regular_price,   :integer,    null: false
    add_column :items,    :proposed_price,  :integer,    null: false
    add_column :items,    :point_get,       :integer,    null: false, default: 0
    add_column :items,    :gender,          :references, null: false
    add_column :items,    :category,        :references, null: false
    add_column :items,    :material,        :string
    add_column :items,    :made_in,         :string
    add_column :items,    :shipping_fee,    :integer,    null: false, default: 200
    add_column :items,    :shipping_option, :integer,    null: false, default: 0
    add_column :items,    :lapping_option,  :integer,    null: false, default: 0
    add_column :items,    :ident_code,      :integer
  end
end
