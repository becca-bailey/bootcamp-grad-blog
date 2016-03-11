class TagsController < ApplicationController
  before_action :get_tag, only: [:show]
  def index 
  end

  def show
    @posts = Post.tagged_with(@tag.name)   
  end

  private

  def get_tag
    @tag = Tag.find(params[:id])
  end
end
