class Pin < ApplicationRecord
  has_many :comments
  belongs_to :user
  mount_uploader :pin_image, PinImageUploader

  # def api_as_json()
  #   {
  #     title: title,
  #     description: description
  #   }
  # end
end
