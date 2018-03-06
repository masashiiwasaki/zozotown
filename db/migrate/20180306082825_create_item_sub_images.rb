class CreateItemSubImages < ActiveRecord::Migration[5.0]
  def change
    create_table :item_sub_images do |t|
      t.references :item,      null: false, foreign_key: true
      t.references :sub_image, null: false
      t.timestamps
    end
  end
end
