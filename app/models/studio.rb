class Studio < ApplicationRecord
  has_many :videos, dependent: :destroy
  has_many :crews
  has_many :users, through: :crews
  has_one_attached :logo
end
