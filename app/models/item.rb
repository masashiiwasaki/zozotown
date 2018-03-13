class Item < ApplicationRecord
  has_many :item_lists
  has_many :images
  has_many :ordered_items
  has_many :dimentions
  has_many :carts, through :item_lists
  has_many :cart_records, through :item_lists
  has_many :favorite_items, through :item_lists
  belongs_to :shop
  belongs_to :brand
  belongs_to :gender
  belongs_to :category
end
