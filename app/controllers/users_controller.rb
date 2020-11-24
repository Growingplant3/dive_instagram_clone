class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "アカウントの作成が成功しました。"
      redirect_to users_path
    else
      flash[:notice] = "アカウントの作成が失敗しました。"
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :comment, :image)
  end
end
