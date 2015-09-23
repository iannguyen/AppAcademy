class SessionsController < ApplicationController
  before_action :logged_in?, only: [:new, :create]

  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )
    if @user
      login!(@user)
    else
      flash.now[:errors] = ["Invalid username/password"]
      render :new
    end
  end

  def new
    render :new
  end

  def destroy
    logout!
    redirect_to new_session_url
  end

end
