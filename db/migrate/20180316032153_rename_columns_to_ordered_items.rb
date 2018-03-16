class RenameColumnsToOrderedItems < ActiveRecord::Migration[5.0]
  def change
    rename_column :ordered_items, :color, :color_name
    rename_column :ordered_items, :size, :size_name
  end
end
