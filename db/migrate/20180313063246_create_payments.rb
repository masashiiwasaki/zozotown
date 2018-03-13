class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.string :method, null: false
      t.integer :fee, null: false
    end
  end
end
