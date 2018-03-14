class CreateDemensions < ActiveRecord::Migration[5.0]
  def change
    create_table :demensions do |t|
      t.references :item, null: false, foreign_key: true
      t.references :size, null: false, foreign_key: true
      t.integer    :shoulder_width
      t.integer    :body_width
      t.integer    :arm_length
      t.integer    :weight
      t.integer    :waist
      t.integer    :rise
      t.integer    :inseam
      t.integer    :hem
      t.integer    :thigh
      t.integer    :hip
      t.timestamps
    end
  end
end
