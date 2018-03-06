class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.integer    :price,       null: false
      t.string     :name,        null: false
      t.text       :description, null: false
      t.references :shops,       null: false
      t.references :brands,      null: false
      t.string     :image_url,   null: false
      t.timestamps
    end
  end
end
