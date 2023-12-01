class Profile < ApplicationRecord
  has_many :profile_pictures
  belongs_to :user
end
