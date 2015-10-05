class UsersController < ApplicationController

  before_action :require_current_user!, except: [:create, :new]

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.create!(user_params)
    if @user.save
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :password_digest, :session_token)
  end
end