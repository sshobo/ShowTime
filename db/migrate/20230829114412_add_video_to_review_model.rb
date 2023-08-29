class AddVideoToReviewModel < ActiveRecord::Migration[7.0]
  def change
    add_reference :reviews, :video, foreign_key: true
  end
end
