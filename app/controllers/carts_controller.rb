class CartsController < ApplicationController
  before_action :move_to_root

  def index
    user = User.find(current_user.id)
    @carts = user.carts
    @total_price = Cart.total_price(@carts)
  end

  def create
    @cart = Cart.new(cart_params)
    @cart[:quantity] += 1
    @cart.save
    redirect_to "/carts", notice: 'カートに入りました'
  end

  def update
    cart = Cart.find(params[:id])
    cart.update(cart_params) if cart.user_id == current_user.id
  end

  def destroy
    cart = Cart.find(params[:id])
    cart.destroy if cart.user_id == current_user.id
    redirect_to "/carts", notice: '商品数量を変更しました。'
  end

private
  def cart_params
    params.permit(:item_list_id, :quantity).merge(user_id: current_user.id)
  end

  def move_to_root
    redirect_to root_path unless user_signed_in?
  end
end
