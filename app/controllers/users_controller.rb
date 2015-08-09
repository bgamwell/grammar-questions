class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    user = User.create(user_params)
    session[:user_id] = user.id

    # redirect_to "/users/#{user.id}"
    # the line above can be refactored to use rails route helpers:
    redirect_to user_path(user)
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
