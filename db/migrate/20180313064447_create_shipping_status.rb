class CreateShippingStatus < ActiveRecord::Migration[5.0]
  def change
    create_table :shipping_statuses do |t|
      t.string :status, null: false
    end
  end
end
