class ItemList < ApplicationRecord
  belongs_to :item
  belongs_to :color
  belongs_to :size
  has_many :cart
end
