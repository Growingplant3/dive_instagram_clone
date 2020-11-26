module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user.present?
  end

  def unauthorized_user
    case controller_name
    when "users","sessions"
      want_type_user = User.find(params[:id])
    when "pictures"
      want_type_user = Picture.find(params[:id]).user
    end
    if current_user != want_type_user
      flash[:danger] = "権限がありません。"
      redirect_to new_user_path
    end
  end
end