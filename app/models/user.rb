class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :photos, dependent: :destroy
  has_many :albums, dependent: :destroy
  has_many :followings, dependent: :destroy
  has_many :followers, dependent: :destroy


  mount_uploader :avatar_url, AvatarUploader
end
