class Post < ApplicationRecord
  belongs_to :user
  has_one :seo
  has_many :comments, as: :commentable
  has_many :commentators, through: :comments, source: :user

  validates :title, :body, presence: true
  validates :title, length: { minimum: 3 }
end
