class User < ActiveRecord::Base
  has_many :posts, :foreign_key => 'author_id'
  has_attached_file :avatar, styles: { medium: "200x200>", thumb: "100x100>" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
