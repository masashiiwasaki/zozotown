class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :user,         null: false, foreign_key: true
      t.integer    :total_price,  null: false
      t.integer    :status,       null: false
      t.timestamps
    end
  end
end
