class AddForeignKeyToItemSubImages < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :sub_images, :colors
  end
end
