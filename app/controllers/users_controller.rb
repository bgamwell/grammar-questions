class UsersController < ApplicationController

  before_filter :authorize, only: [:show]

  def new
    if current_user
      redirect_to profile_path
    else
      @user = User.new
      render :new
    end
  end

  def create
    if current_user
      redirect_to profile_path
    else
      user = User.create(user_params)
      session[:user_id] = user.id

      # redirect_to "/users/#{user.id}"
      # the line above can be refactored to use rails route helpers:
      redirect_to user_path(user)
    end
  end

  def show
    @user = User.find(session[:user_id])
    render :show
  end

  private
    def user_params
      params.require(:user).permit(:email, :password)
    end

end
