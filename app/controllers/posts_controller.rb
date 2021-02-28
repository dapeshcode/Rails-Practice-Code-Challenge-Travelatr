class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @destinations = Destination.all
    @bloggers = Blogger.all
  end

  # def create
  #   new_post = Post.create(post_params)
  #   redirect_to post_path(new_post)
  # end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end

  private 

  def post_params 
    params.require(:post).permit(:title, :content, :blogger_id, :destination_id)
  end 

end
