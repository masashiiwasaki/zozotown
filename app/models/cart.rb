class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :item_list
  has_many   :items, through: :item_lists

  # accepts_nested_attributes_for :cart_records

  def self.total_price(carts)
    total_price = 0
    carts.each do |cart|
      total_price += cart.item_list.item.proposed_price
    end
    return total_price
  end

  def self.add_order_items_and_destory_carts(carts, ordered_history_id)
    carts.each {|cart|
      OrderedItem.create!(order_history_id: ordered_history_id, item_id: cart.item_list.item_id, color_id: cart.item_list.color_id, size_id: cart.item_list.size_id, quantity: cart.quantity, regular_price: cart.item_list.item.regular_price, item_name: cart.item_list.item.name, shop_name: cart.item_list.item.shop.name, color_name: cart.item_list.color[:color], size_name: cart.item_list.size[:size])
      cart.destroy!
    }
  end
end
