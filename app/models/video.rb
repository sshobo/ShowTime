class Video < ApplicationRecord
  has_one_attached :thumbnail
  has_one_attached :videofile
end
