class Pin < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :comments, dependent: :destroy
  has_many :poly_comments, as: :commentable, dependent: :destroy
  belongs_to :user

  mount_uploader :pin_image, PinImageUploader

  acts_as_taggable_on :tags
  acts_as_taggable_on :categories

  # def api_as_json()
  #   {
  #     title: title,
  #     description: description
  #   }
  # end

  # def to_param
  #   "#{title.parameterize}"
  # end
end
