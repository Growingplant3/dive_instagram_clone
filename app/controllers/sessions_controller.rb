class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "ログインに成功しました。"
      redirect_to user_path(user.id)
    else
      flash[:danger] = "ログインに失敗しました。"
      render :new
    end
  end
end
