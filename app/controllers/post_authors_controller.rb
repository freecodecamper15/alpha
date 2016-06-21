class PostAuthorsController < ApplicationController
  before_action :find_post

  def show
    @author = @post.author
  end

  def new
    @author = @post.build_author
  end

  def create
    @author = @post.build_author(author_params)

    if @author.save
      redirect_to post_author_url(@post)
      flash[:notice] = "New author #{@author} has been saved."
    else
      render :new
      flash[:alert] = "Bro don't go too fast! NOTHING was saved!!!"
    end
  end

  def edit
    @author = @post.author
  end

  def update
    @author = @post.author

    if @author.update(author_params)
      redirect_to post_author_url(@post)
      flash[:notice] = "You've successsfully updated the author to #{@author}."
    else
      render :action => :edit
      flash[:alert] = 'Update unsuccessful. Please give it another shot!'
    end
  end

  def destroy
    @author = @post.author

    if @author.destroy
      redirect_to posts_path
      flash[:notice] = 'Congrats, you have successfully removed an author!'
    else
      flash[:alert] = 'Elimination was unsuccessful'
    end
  end

  protected

  def find_post
    @post = Post.find(params[:post_id])
  end

  def author_params
    params.require(:author).permit(:name)
  end
end
