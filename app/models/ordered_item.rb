class OrderedItem < ApplicationRecord
  belongs_to :order_history
  belongs_to :item
  belongs_to :color
  belongs_to :size
end
