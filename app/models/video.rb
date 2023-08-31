class Video < ApplicationRecord
  belongs_to :user
  belongs_to :studio, optional: true
  has_one_attached :thumbnail
  has_one_attached :videofile

  validates :title, presence: true

  CATEGORIES = [
    'Drama',
    'Action',
    'Horror',
    'Documentary',
    'Romance',
    'Comedy',
    'Thriller',
    'Epic',
    'Crime'
    'TV',
    'Trending_TV',
    'Top_TV'
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

  # validates :language, inclusion: Video::LANGUAGES
  # validates :category, inclusion: Video::CATEGORIES
end
