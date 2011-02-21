class PostsController < ApplicationController
  before_filter :log_in?, :except => [:show, :index]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @user = current_user
    @post = @user.posts.new(params[:post])

      if @post.save
        redirect_to(@post, :notice => 'Post was successfully created.')
      else
        render :action => "new" 
      end
  end

  def update
    @post = Post.find(params[:id])
#    params[:post].delete(:tags)
#    @post.tag_list = params[:post][:tags]
    if @post.update_attributes(params[:post])
      redirect_to(@post, :notice => 'Post was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to(posts_url) 
  end
end
