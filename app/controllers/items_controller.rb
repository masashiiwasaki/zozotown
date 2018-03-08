class ItemsController < ApplicationController
  def index
    @items = Item.includes(:shop).includes(:brand)
  end
end
