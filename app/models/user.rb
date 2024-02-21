class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self
  
  has_one :profile

  has_many :pins
  has_many :comments
  has_many :carts, as: :cartable

  has_one :invite, class_name: "Invite", foreign_key: "invitee_id"
  has_many :invites, class_name: "Invite", foreign_key: "inviter_id"

  has_one :onboarding

  after_create :create_user_profile
  after_create :create_invites
  after_create :create_user_onboarding

  def create_user_profile
    self.create_profile(username: "test", about: "Test test test")
  end

  def create_invites
    3.times do
      Invite.create(inviter_id: id)
    end
  end

  def create_user_onboarding
    self.create_onboarding
  end

end
