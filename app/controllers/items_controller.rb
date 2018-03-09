class ItemsController < ApplicationController
  def index
    @items = Item.includes(:shop).includes(:brand)
  end
  def show
  end
end
