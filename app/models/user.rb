class User < ApplicationRecord
  has_one :seo, as: :seoble
  has_many :posts
  has_many :comments
  has_many :commented_posts, through: :comments, source: :commentable, source_type: :Post
  has_many :commented_users, through: :comments, source: :commentable, source_type: :User

  validates :name, presence: true
  validates :name, length: { maximum: 16, minimum: 2 }
  validates :name, uniqueness: true
end
