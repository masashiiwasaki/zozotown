class ItemSubImages < ActiveRecord::Migration[5.0]
  def change
    drop_table :item_sub_images
    drop_table :sub_images
  end
end
