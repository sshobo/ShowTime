class Genre < ApplicationRecord
  has_many :videogenrejoins
  has_many :videos, through: :videogenrejoins

  validates :name, uniqueness: true
end
