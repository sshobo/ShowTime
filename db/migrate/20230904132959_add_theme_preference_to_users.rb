class AddThemePreferenceToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :theme_preference, :integer, default: 0
  end
end
