class HomeController < ApplicationController
  def index
    @featured
    @published = Post.where(is_published: true).order("created_at DESC")
  end
end
