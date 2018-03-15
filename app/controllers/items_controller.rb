class ItemsController < ApplicationController
  def index
    @items = Item.includes(:shop).includes(:brand)
  end

  def show
    @item = Item.new
  end

  def search
    @searchItems = Item.where('name LIKE(?)', "%#{params[:keyword]}%")
    # binding.pry
    respond_to do |format|
      format.html
      format.json
    end
  end

  def searchResult
    @searchItemsResult = Item.where(id: params[:id])
    # binding.pry
    respond_to do |format|
      format.html
      format.json {render json: @searchItemsResult }
    end
  end

end
