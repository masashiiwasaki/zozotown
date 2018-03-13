class ChangeOrderHistories < ActiveRecord::Migration[5.0]
  def change
    add_reference :order_histories, :shiping_status, null: false, foreign_key: true
  end
end
