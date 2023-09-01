class CreateVideos < ActiveRecord::Migration[7.0]
  def change
    create_table :videos do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :views
      t.string :title
      t.string :language
      t.string :type
      t.text :description

      t.timestamps
    end
  end
end
