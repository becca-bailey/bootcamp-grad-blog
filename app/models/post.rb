class Post < ActiveRecord::Base
  # fix this association
  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: "author_id"

  has_attached_file :image, styles: { large: "800x600", medium: "400x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  # scope :ordered, :order => "created_at DESC"

  def self.published
    Post.where(is_published: true).order("created_at DESC")
  end

  def self.unpublished
    Post.where(is_published: false)
  end
end
