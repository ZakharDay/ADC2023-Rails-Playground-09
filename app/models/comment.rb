class Comment < ApplicationRecord
  has_many :replies, class_name: "Comment", foreign_key: "reply_to_comment_id"
  belongs_to :comment, class_name: "Comment", foreign_key: "reply_to_comment_id", optional: true

  belongs_to :pin
  belongs_to :user

  default_scope { where(reply_to_comment_id: nil) }

  # scope :not_replies, -> { where(out_of_print: true) }
end
