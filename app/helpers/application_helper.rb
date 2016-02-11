module ApplicationHelper
  def featured_post_image
    featured_post = Post.where(is_featured: true)[0]
    featured_post.image
  end
end
