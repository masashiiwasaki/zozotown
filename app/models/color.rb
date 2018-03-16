class Color < ApplicationRecord
  has_many :carts
  has_many :items, through: :item_lists
  has_many :item_lists
  has_many :sub_images
  has_many :ordered_items
end
