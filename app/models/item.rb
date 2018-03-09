class Item < ApplicationRecord
  has_many :item_lists
  has_many :item_sub_images
  has_many :sub_images, through: :item_sub_images
  has_many :ordered_items
  has_many :orders, through: :ordered_items
  has_many :users, through: :carts
  belongs_to :shop
  belongs_to :brand
end
