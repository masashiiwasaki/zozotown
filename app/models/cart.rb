class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :item
  belongs_to :color
  belongs_to :size

  def total_price(carts)
    total_price = 0
    carts.each do |cart|
      total_price += cart.item.price
    end
    return total_price
  end
end
