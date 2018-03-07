class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.integer    :price,       null: false
      t.string     :name,        null: false
      t.text       :description, null: false
      t.references :shop,        null: false
      t.references :brand,       null: false
      t.string     :image_url,   null: false
      t.timestamps
    end
  end
end
