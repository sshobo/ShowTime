class ChangeTypeToVideoType < ActiveRecord::Migration[7.0]
  def change
    rename_column :videos, :type, :video_type
  end
end
