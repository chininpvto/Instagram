class PostsController < ApplicationController

  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.new(permit_post)

    if @post.save
      flash[:success] = "The post was created!"
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])

    if @post.update(permit_post)
      redirect_to @post, notice: "The post was updated!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])

    if @post.destroy
      redirect_to posts_path, notice: "The post was destroyed!"
    else
      redirect_to posts_path
    end
  end

  private

  def permit_post
    params.require(:post).permit(:description, :image)
  end

end
