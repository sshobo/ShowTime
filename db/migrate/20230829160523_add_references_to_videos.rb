class AddReferencesToVideos < ActiveRecord::Migration[7.0]
  def change
    add_reference :videos, :studio, foreign_key: true
  end
end
