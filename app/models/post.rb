class Post < ApplicationRecord
  has_many :poly_comments, as: :commentable, dependent: :destroy
  validates :title, presence: true
  has_rich_text :body
end
