class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      flash[:notice] = 'You awesome post was successfully created!'
      redirect_to @post
    else
      flash[:alert] = 'Oops, your awesome post was not created... Please try again!'
      render :new
    end
  end

  def show
    @page_title = @post.title
  end

  def edit

  end

  def update
    if @post.update(post_params)
      redirect_to @post
      flash[:notice] = 'Your post has been successfully updated!'
    else
      render :edit
      flash[:alert] = 'Unsuccessful update... Please try again!'
    end
  end

  def destroy
    if @post.destroy
      flash[:notice] = 'The post has been deleted!'
      redirect_to posts_path
    else
      flash[:alert] = 'Beware! The post is still alive and well...'
    end
  end

private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
