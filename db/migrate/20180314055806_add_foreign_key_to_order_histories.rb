class AddForeignKeyToOrderHistories < ActiveRecord::Migration[5.0]
  def change
    add_reference :order_histories, :shipping_status, null: false, foreign_key: true
  end
end
