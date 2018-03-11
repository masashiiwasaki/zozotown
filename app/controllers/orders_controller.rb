class OrdersController < ApplicationController
  def new
    @carts = Cart.where(user_id: 1)
    @items_total_price = @carts.inject(0){|result, cart| result + cart.quantity * cart.item.price }
  end

  def create
    Payjp.api_key = PAYJP_SECRET_KEY
    Payjp::Charge.create(currency: 'jpy', amount: params[:amount], card: params['payjp-token'])
  end
end
