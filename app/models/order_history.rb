class OrderHistory < ApplicationRecord
  has_many :ordered_items
  belongs_to :order
  belongs_to :shipping_status
end
