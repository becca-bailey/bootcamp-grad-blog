class Post < ActiveRecord::Base
  # fix this association
  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: "author_id"
  belongs_to :category
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  has_attached_file :image, styles: { x_large: "1200x800", small: "400x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  # scope :ordered, :order => "created_at DESC"

  def self.published
    Post.where(is_published: true).order("created_at DESC")
  end

  def self.unpublished
    Post.where(is_published: false)
  end

  def content_limited
    words = self.content.split
    if words.length < 50
      return self.content
    else
      words[0..50].join(' ') + "..."
    end       
  end

  def all_tags=(names)
    self.tags = names.split(",").map do |name|
        Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:name).join(", ")
  end

  def self.tagged_with(name)
    Tag.find_by_name!(name).posts
  end

  def status
    if self.is_published == true
      return "Published"
    else
      return "Submitted on #{self.created_at.strftime("%B %d, %Y")}"
    end
  end
end
