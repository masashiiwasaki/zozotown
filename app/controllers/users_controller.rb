class UsersController < ApplicationController
  def show
    # ユーザー情報の取得
    @user = User.find(current_user.id)
    # ユーザーの基本情報の取得
    @address_default = AddressList.find_by(user_id: current_user.id, default_flag: 0)
    # ユーザーのお届け先を取得
    @address_lists = AddressList.where(user_id: current_user.id, default_flag: 1)
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if current_user.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def user_params
    params.require(:user).permit(:email)
  end
end
