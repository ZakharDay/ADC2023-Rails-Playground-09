class ProfilePicture < ApplicationRecord
  belongs_to :profile

  mount_uploader :user_profile_picture, UserProfilePictureUploader
end
