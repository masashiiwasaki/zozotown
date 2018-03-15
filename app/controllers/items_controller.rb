class ItemsController < ApplicationController
  def index
    @items = Item.includes(:shop).includes(:brand)
    # チェック済商品を画面表示
    @checked_items = Item.where(id: session[:checked_item_ids])
  end
  def show
    # チェックした商品をsessionに保存し、チェック済商品を画面表示できるようにする
    # sessionがない場合は初期化
    session[:checked_item_ids] = session[:checked_item_ids].present? ? session[:checked_item_ids] : []
    # sessionにチェックした商品IDを保存
    session[:checked_item_ids] << params[:id]
    @checked_items = Item.where(id: session[:checked_item_ids])
    @item = Item.find(params[:id])
  end
end
