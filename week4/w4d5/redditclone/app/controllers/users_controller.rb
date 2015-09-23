class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      #redirect
      login!(@user)
      
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def index
    @users = User.all

  end

  def new
    @user = User.new
  end

  def edit
  end

  def update
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :session_token)
  end

end
