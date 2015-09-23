class SubsController < ApplicationController
  before_action :require_login
  before_action :verify_current_user, only: [:edit, :update, :destroy]

  def create
    @sub = Sub.new(sub_params)
    @sub.moderator_id = current_user.id

    if @sub.save
      @subs = Sub.all
      render :index
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def new
    @sub = Sub.new
    render :new
  end

  def index
    @subs = Sub.all
    render :index
  end

  def show
    @sub = Sub.find(params[:id])
    @posts = Post.includes(:sub)
    render :show
  end

  def edit
    @sub = Sub.find(params[:id])
    render :edit
  end

  def destroy
    @sub = Sub.find(params[:id])
    @sub.destroy
    redirect_to subs_url
  end

  def update
    @sub = Sub.find(params[:id])
    @sub.update(sub_params)
    redirect_to sub_url(@sub)
  end

  private
  def sub_params
    params.require(:sub).permit(:title, :description)
  end

  def verify_current_user
    @sub = Sub.find(params[:id])
    unless current_user.id == @sub.moderator_id
      flash[:errors] = ["STOP YOU HACKER!"]
      redirect_to subs_url
    end
  end
end
