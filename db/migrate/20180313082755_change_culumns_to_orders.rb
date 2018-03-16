class ChangeCulumnsToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :shipping_schedule, :datetime
    add_column :orders, :point_used, :integer, null: false, default: 0
    add_column :orders, :point_get, :integer, null: false
    remove_column :orders, :status, :integer

    # 外部キー追加
    add_reference :orders, :address_list, null: false, foreign_key: true
    add_reference :orders, :shipment, null: false, foreign_key: true
    add_reference :orders, :payment, null: false, foreign_key: true
  end
end
