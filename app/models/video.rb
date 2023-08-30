class Video < ApplicationRecord
  belongs_to :user
  belongs_to :studio
  has_one_attached :thumbnail
  has_one_attached :videofile

  validates :title, presence: true

  CATEGORIES = [
    'Drama',
    'Action',
    'Horror'
  ]

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

  validates :language, inclusion: Video::LANGUAGES
  validates :categories, inclusion: Video::CATEGORIES
end
