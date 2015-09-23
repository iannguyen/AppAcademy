class SessionsController < ApplicationController

  before_action :require_current_user!, except: [:create, :new]
  before_action :no_login_when_logged_in, only: [:create, :new]
    #refers to actions #create and #new
    
  def new
  end

  def create
    @user = User.find_by_credentials(params[:user][:user_name], params[:user][:password])
    if @user.nil?
      render text: "Invalid credentials"
    else
      login!(@user)
      redirect_to cats_url
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end

end
