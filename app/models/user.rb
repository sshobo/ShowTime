class User < ApplicationRecord
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

  accepts_nested_attributes_for :casts

  def full_name
    "#{first_name} #{last_name}"
  end
end
