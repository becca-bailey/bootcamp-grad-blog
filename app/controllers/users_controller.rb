class UsersController < ApplicationController
  def show
    if user_signed_in?
      @posts = Post.published + Post.unpublished.where(user_id: current_user.id)
    end
  end
end
