class HomeController < ApplicationController
  def index
    @featured
    @published = Post.where(is_published: true).order("created_at DESC")
  end

  def dashboard
    @user_posts = current_user.posts
  end
end
