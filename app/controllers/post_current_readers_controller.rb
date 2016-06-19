class PostCurrentReadersController < ApplicationController
  before_action :find_post

  def index
    @current_readers = @post.current_readers
  end

  def show
    @current_reader = @post.current_readers.find(params[:id])
  end

  def new
    @current_reader = @post.current_readers.build
  end

  def create
    @current_reader = @post.current_readers.build(current_reader_params)
    if @current_reader.save
      flash[:notice] = "#{@current_reader} has been saved!"
      redirect_to post_current_readers_url( @post )
    else
      flash[:alert] = 'Nothing was saved... Try again!'
      render :action => :new
    end
  end

  def edit
    @current_reader = @post.current_readers.find(params[:id])
  end

  def update
    @current_reader = @post.current_readers.find(params[:id])
    if @current_reader.update(current_reader_params)
      flash[:notice] = "#{@current_reader} is indeed awesome!"
      redirect_to post_current_readers_url( @post )
    else
      flash[:alert] = 'Edit was unsuccessful!'
      render :action => :edit
    end
  end

  def destroy
    @current_reader = @post.current_readers.find(params[:id])
    if @current_reader.destroy
      flash[:notice] = 'Congrates on the elimination!'
      redirect_to post_current_readers_url( @post )
    else
      flash[:alert] = "Run!! #{@current_reader} is still alive!!!"
    end
  end


  protected

  def find_post
    @post = Post.find(params[:post_id])
  end

  def current_reader_params
    params.require(:current_reader).permit(:name)
  end

end