class PostsController < ApplicationController
  def index
    # @posts = Post.published
    @posts = Post.all
  end

  def search
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    puts current_user.id
    if @post.save
      redirect_to @post
    else
      render "new"
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
