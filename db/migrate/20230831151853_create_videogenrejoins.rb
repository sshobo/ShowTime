class CreateVideogenrejoins < ActiveRecord::Migration[7.0]
  def change
    create_table :videogenrejoins do |t|
      t.references :video, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
