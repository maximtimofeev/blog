class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post, optional: true
  belongs_to :commentable, polymorphic: true

  validates :body, presence: true, length: { minimum: 3 }
end
