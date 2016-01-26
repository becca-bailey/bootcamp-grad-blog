class Post < ActiveRecord::Base
  belongs_to :author, class_name: :user, foreign_key: :author_id
  scope :ordered, :order => "created_at DESC"

  def self.published
    Post.where(is_published: true)
  end

  def self.unpublished
    Post.where(is_published: false)
  end
end
