class PostsController < ApplicationController
  before_action :verify_post_author, only: [:edit, :update, :destroy]

  def new
    @post = Post.new
  
    @subs = Sub.all
    render :new
  end

  def create
    @post = Post.new(post_params)

    @post.author_id = current_user.id
    # fail
    if @post.save
      redirect_to subs_url
    else
      flash.now[:errors] = @post.errors.full_messages
      @subs = Sub.all
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    @sub = Sub.find_by_id(params[:sub_id])
    render :edit
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to sub_url(@post.sub_id)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    id = @post.sub_id
    @post.destroy
    redirect_to sub_url(id)
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :content, sub_ids: [])
  end
  def verify_post_author
    @post = Post.find(params[:id])
    unless current_user.id == @post.author_id
      flash[:errors] = ["STOP YOU HACKER!"]
      redirect_to sub_url(@post)
    end
  end
end
