class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    log_in?
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    log_in?
    @user = current_user
    @post = @user.posts.new(params[:post])

      if @post.save
        redirect_to(@post, :notice => 'Post was successfully created.')
      else
        render :action => "new" 
      end
  end

  def update
    log_in?
    @post = Post.find(params[:id])

    if @post.update_attributes(params[:post])
      redirect_to(@post, :notice => 'Post was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
#    auth?
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to(posts_url) 
  end
end
