class ItemList < ApplicationRecord
  belongs_to :item
  belongs_to :size
  belongs_to :color
  has_many :carts
  has_many :cart_records
  has_many :favorite_items
  has_many :users, through: :carts
end
