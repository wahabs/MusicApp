class SessionsController < ApplicationController
  before_action :redirect_if_logged_in, only: :new

  def create
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )

    if user.nil?
      flash.now[:errors] ||= []
      flash.now[:errors] << "Credentials were wrong"
      render :new
    else
      log_in_user!(user)
      redirect_to user_url(user)
    end

  end

  def destroy
    log_out_user!
    redirect_to new_session_url
  end

  def new
    render :new
  end

  private

  def redirect_if_logged_in
    redirect_to user_url unless session[:session_token].nil?
  end

end
