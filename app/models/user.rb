require 'open-uri'
class User < ApplicationRecord
  after_commit :set_pfp, on: :create
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :videos, dependent: :destroy
  has_many :crews
  has_many :studios, through: :crews
  has_many :casts
  # has_one :role, through: :casts
  has_many :videos, through: :casts
  has_one_attached :profile


  enum theme_preference: [ :light, :dark ]
  accepts_nested_attributes_for :casts

  def full_name
    "#{first_name} #{last_name}"
  end





  def set_pfp
    url = "https://ui-avatars.com/api/?name=#{self.first_name}+#{self.last_name}?size=512"
    pfp = URI.open(url)
    self.profile.attach(
      io: pfp, # TO DO: update file
      filename: "#{self}.jpg",
      content_type: 'image/jpg'
    )
  end
end
