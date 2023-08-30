class Video < ApplicationRecord
  belongs_to :user
  belongs_to :studio
  has_one_attached :thumbnail
  has_one_attached :videofile
end
