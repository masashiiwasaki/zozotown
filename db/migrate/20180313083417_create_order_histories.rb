class CreateOrderHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :order_histories do |t|
      t.references :order, null: false, foreign_key: true
      t.datetime :shipping_schedule
      t.date :shipped_date
    end
  end
end

