class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :item
  belongs_to :color
  belongs_to :size

  def self.total_price(carts)
    total_price = 0
    carts.each do |cart|
      total_price += cart.item.price
    end
    return total_price
  end

  def self.add_order_items_and_destory_carts(carts, ordered_id)
    carts.each {|cart|
      OrderedItem.create(order_id: ordered_id, item_id: cart.item_id, color_id: cart.color_id, size_id: cart.size_id, quantity: cart.quantity)
      cart.destroy
    }
  end
end
