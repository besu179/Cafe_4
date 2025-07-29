class ApplicationController < ActionController::API
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  def sign_in(user)
    session[:user_id] = user.id
  end
  def sign_out
    session.delete(:user_id)
  end
  def require_login
    redirect_to login_path unless current_user
  end
  helper_method :current_user

end
