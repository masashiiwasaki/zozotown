class FavoriteItemController < ApplicationController
  def create
    @favorite = FavoriteItem.new(user_id: 1, item_list_id: params[:item_list_id])
    @favorite.save!
    respond_to do |format|
      format.json
    end
  end

  def destroy
    @favorite.destroy!
  end
end
