class UsersController < ApplicationController

  before_action :redirect_if_not_logged_in, only: :show

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # log me in
      redirect_to user_url
    else
      render :new
    end
  end

  def show
    @user = current_user
    render :show
  end


  private

    def user_params
      params.require(:user).permit(:email, :password)
    end

    def redirect_if_not_logged_in
      redirect_to new_session_url if current_user.nil?
    end

end
