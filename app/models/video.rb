class Video < ApplicationRecord
  belongs_to :user
  belongs_to :studio, optional: true
  has_many :videogenrejoins, dependent: :destroy
  has_many :genres, through: :videogenrejoins
  has_many :reviews, dependent: :destroy
  has_many :casts, dependent: :destroy
  has_many :users, through: :casts
  has_one_attached :thumbnail
  has_one_attached :videofile

  validates :title, presence: true
  validates :title, uniqueness: true

  LANGUAGES = [
    "English",
    "French",
    "Mandarin Chinese",
    "Spanish",
    "Hindi",
    "Arabic",
    "Bengali",
    "Portuguese",
    "Russian",
    "Japanese",
    "German",
    "Telugu",
    "Vietnamese",
    "Marathi",
    "Korean",
    "Tamil",
    "Italian",
    "Turkish"
  ]

  # validates :language, inclusion: Video::LANGUAGES
  # validates :category, inclusion: Video::CATEGORIES
end
