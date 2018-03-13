class CreateShipments < ActiveRecord::Migration[5.0]
  def change
    create_table :shipments do |t|
      t.string :method, null: false
      t.integer :fee, null: false
    end
  end
end
