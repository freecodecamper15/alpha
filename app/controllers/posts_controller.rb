class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]


  def index

    # @posts = Post.all
    @posts = Post.page(params[:page]).per(5)
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

  def latest
    @posts = Post.order('id DESC').limit(3)
  end

  def bulk_delete
    Post.destroy_all
    redirect_to posts_path
  end

  def bulk_update
    ids = Array
  end

  def dashboard
    @post = Post.find(params[:id])
  end

  def join
    @post = Post.find(params[:id])
    Membership.find_or_create_by( :post => @post, :user => current_user)

    redirect_to :back
  end

  def withdraw
    @post = Post.find(params[:id])

    @membership = Membership.find_by( :post => @post, :user => current_user)
    @membership.destroy

    redirect_to :back
  end

private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :category_id, :language_attributes =>
     [:id, :language, :_destroy], :language_ids => [])
  end
end
