class CartsController < ApplicationController
  before_action :move_to_root
  def index
    user = User.find(current_user.id)
    @carts = user.carts
    @total_price = Cart.total_price(@carts)
    # TO DO : 現在カートに入っている商品は除外して、@cart_recordsに取り込む
    @cart_records = user.cart_records.limit(6)
  end

  def create
    # カートに商品を追加
    ActiveRecord::Base.transaction do
      if Cart.find_by(user_id: current_user.id, item_list_id: cart_params[:item_list_id]).present?
        cart = Cart.find_by(user_id: current_user.id, item_list_id: cart_params[:item_list_id])
      else
        cart = Cart.new(cart_params)
      end
      cart[:quantity] += 1
      cart.save!

      # カートの履歴に商品を追加
      cart_record(cart_params)
    end
      # カート画面に遷移
      redirect_to "/carts", notice: 'カートに入りました'
    rescue => e
      redirect_to "/carts", notice: 'error'
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
    params.permit(
      :item_list_id,
      :quantity,
      # cart_records_attributes: [:item_list_id]
      ).merge(user_id: current_user.id)
  end

  def cart_record(cart_params)
    if CartRecord.find_by(user_id: current_user.id, item_list_id: cart_params[:item_list_id]).present?
      cart_record = CartRecord.find_by(user_id: current_user.id, item_list_id: cart_params[:item_list_id])
      cart_record.destroy!
    end
    cart_record = CartRecord.create!(cart_params)
  end

  def move_to_root
    redirect_to root_path unless user_signed_in?
  end
end
