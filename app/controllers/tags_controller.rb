class TagsController < ApplicationController
  before_action :get_tag, only: [:show]
  def index
  end

  def show   
  end

  private

  def get_tag
    @tag = Tag.find(params[:id])
  end
end
