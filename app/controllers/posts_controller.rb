class PostsController < ApplicationController
  before_filter :log_in?, :except => [:show, :index, :tag]

  def index
    @posts = Post.all.paginate :page => params[:page], :per_page => 10

    respond_to do |format|
      format.html
      format.rss { render :layout => false } #index.rss.builder
    end
  end

  def tag
    @posts = Post.tagged_with(params[:tag]).paginate(:page => params[:page], \
        :per_page => 20)
    render "index"
  end

  def show
    @post = Post.find(params[:id])
    @title = @post.title
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
