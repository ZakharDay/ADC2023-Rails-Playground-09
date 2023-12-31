class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :pins
  has_many :comments
  has_one :profile

  after_create :create_profile

  def create_profile
    Profile.create(user_id: id, username: "test", about: "Test test test")
  end
end
