class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  before_action :unauthorized_user, only: %i[edit update destroy]

  def new
    redirect_to pictures_path if logged_in?
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "アカウントの作成が成功しました。"
      redirect_to new_session_path
    else
      flash.now[:danger] = "アカウントの作成が失敗しました。"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "アカウントの編集が成功しました。"
      redirect_to user_path(@user)
    else
      flash.now[:danger] = "アカウントの編集が失敗しました。"
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:notice] = "アカウントを削除しました。"
    redirect_to new_user_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :comment, :image)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
