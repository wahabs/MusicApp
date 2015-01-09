class ApplicationController < ActionController::Base
  helper_method :current_user, :redirect_if_not_logged_in

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    return nil unless logged_in?
    @current_user = User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    !session[:session_token].nil?
  end

  def log_in_user!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
  end

  def log_out_user!
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def redirect_if_not_logged_in
    redirect_to new_session_url if current_user.nil?
  end

end
