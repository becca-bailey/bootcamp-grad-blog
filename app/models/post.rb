class Post < ActiveRecord::Base
  # fix this association
  belongs_to :author, class_name: "User", foreign_key: "author_id"
  # scope :ordered, :order => "created_at DESC"

  def self.published
    Post.where(is_published: true).order("created_at DESC")
  end

  def self.unpublished
    Post.where(is_published: false)
  end
end
