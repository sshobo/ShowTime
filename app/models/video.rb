class Video < ApplicationRecord
  belongs_to :user
  has_one_attached :thumbnail
  has_one_attached :videofile

end
