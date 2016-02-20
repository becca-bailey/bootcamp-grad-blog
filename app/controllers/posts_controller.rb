class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :get_post, only: [:show, :edit, :update, :destroy]
  def index
    @posts = Post.all
    @published = Post.where(is_published: true)
  end

  def search
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post, notice: "Post was successfully created"
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Post was successfully updated"
    else
      render "edit"
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :image, :all_tags)
  end

  def get_post
    @post = Post.find(params[:id])
  end
end
