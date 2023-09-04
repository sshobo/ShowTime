class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :videos, dependent: :destroy
  has_many :crews
  has_many :studios, through: :crews
  has_one_attached :profile

  enum theme_preference: [ :light, :dark ]
end
