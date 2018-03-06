class CreateSubImages < ActiveRecord::Migration[5.0]
  def change
    create_table :sub_images do |t|
      t.references :color_id,   null: false
      t.string     :image_url,  null: false
      t.timestamps
    end
  end
end
