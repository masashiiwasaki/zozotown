class ItemsController < ApplicationController
  def index
    @items = Item.includes(:shop).includes(:brand)
  end
  def show
    # チェックした商品をsessionに保存し、チェック済商品を画面表示できるようにする
    # sessionがない場合は初期化
    unless session[:checked_items]
      session[:checked_items] = []
    end
    # sessionにチェックした商品IDを保存
    session[:checked_items] << params[:id]
    @checked_items = session[:checked_items]
    @item = Item.find(params[:id])
  end
end
