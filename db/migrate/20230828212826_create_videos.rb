class CreateVideos < ActiveRecord::Migration[7.0]
  def change
    create_table :videos do |t|
      t.integer :views
      t.string :title
      t.string :language
      t.string :type
      t.string :category
      t.text :description

      t.timestamps
    end
  end
end
