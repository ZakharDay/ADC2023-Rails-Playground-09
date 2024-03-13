class Pin < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :comments, dependent: :destroy
  has_many :poly_comments, as: :commentable, dependent: :destroy
  belongs_to :user

  has_many :favourites
  has_many :users_who_favourited, through: :favourites, source: 'user'

  has_many :likes
  has_many :users_who_liked, through: :likes, source: 'user'

  mount_uploader :pin_image, PinImageUploader

  acts_as_taggable_on :tags
  acts_as_taggable_on :categories

  scope :active, -> { where("ending_at > ?", Time.now) }

  self.per_page = 10

  # def api_as_json()
  #   {
  #     title: title,
  #     description: description
  #   }
  # end

  # def to_param
  #   "#{title.parameterize}"
  # end

  after_touch do |pin|
    puts "=========================="
    puts "You have touched an object"
    puts "=========================="

    Turbo::StreamsChannel.broadcast_replace_to("pin_#{id}", content: self)
  end
end
