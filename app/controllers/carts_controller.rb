class CartsController < ApplicationController
  # before_action後で設定
  # 本実装ではログイン時の分岐を足す
  def index
    user = User.find(1)
    # user = User.find(current_user.id)
    @carts = user.carts
    total_price(@carts)
  end

  def create
    @cart = Cart.new(cart_params)
    @cart[:quantity] += 1
    @cart.save
    redirect_to "/carts", notice: 'カートに入りました'
  end

  def update
    cart = Cart.find(params[:id])
    cart.update(cart_params)
    # if cart.user_id == current_user.id
  end

  def destroy
    cart = Cart.find(params[:id])
    cart.destroy
    # if cart.user_id == current_user.id
    redirect_to "/carts", notice: '商品数量を変更しました。'
  end

private
  def cart_params
    params.require(:cart).permit(:item_id, :color_id, :size_id, :quantity).merge(user_id: 1)
    # .merge(user_id: current_user.id)
  end

  def total_price(carts)
    @total_price = 0
    carts.each do |cart|
      @total_price += cart.item.price
    end
  end
end
