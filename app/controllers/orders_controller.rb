class OrdersController < ApplicationController
  def new
    carts = Cart.where(user_id: 1)
    @items_total_price = carts.inject(0){|result, cart| result + cart.quantity * cart.item.price }
  end

  def create
    # ZOZOTOWNのDBに注文データ登録
    carts = Cart.where(user_id: 1)
    order = Order.new(user_id: 1, total_price: params[:amount].to_i, status: 1)
    if order.save
      ordered_id = Order.last.id
      Cart.add_order_items_and_destory_carts(carts, ordered_id)
    else
    end

    # PAYJPサーバに決済データ送信
    Payjp.api_key = PAYJP_SECRET_KEY
    Payjp::Charge.create(currency: 'jpy', amount: params[:amount], card: params['payjp-token'])
  end
end
