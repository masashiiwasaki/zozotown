class AddressListsController < ApplicationController
  before_action :address_list, only: [:update, :destroy]
  def new
    @address_list = AddressList.new
    @user = User.find(current_user.id)
  end

  def create
    # default_flag(基本情報)の判定
    if AddressList.find_by(user_id: current_user.id, default_flag: 0).present?
      address_list = AddressList.new(address_params)
      address_list[:default_flag] = 1
    else
      address_list = AddressList.new(address_params)
      address_list[:default_flag] = 0
    end
    # 登録可否の判定
    if address_list.save
      redirect_to "/users/:id", notice: 'お届け先が追加されました'
    else
      redirect_to ({ action: new }), alert: 'お届け先の追加に失敗しました'
     end
  end

  def edit
    @user = User.find(current_user.id)
    @address_list = AddressList.find(params[:id])
  end

  def update
   address_list.update(address_params) if address_list.user_id == current_user.id
    redirect_to "/users/:id", notice: "お届け先が変更されました"
  end

  def destroy
    address_list.destroy if address_list.user_id == current_user.id
    redirect_to "/users/:id", notice: "お届け先が削除されました"
  end

  private

  def address_list
    address_list = AddressList.find(params[:id])
  end

  def address_params
    params.require(:address_list).permit(:name, :postcode, :address_main, :address_sub, :telephone_number, :default_flag).merge(user_id: current_user.id)
  end

end
