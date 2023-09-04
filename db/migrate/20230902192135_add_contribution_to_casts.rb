class AddContributionToCasts < ActiveRecord::Migration[7.0]
  def change
    add_column :casts, :contribution, :text, default: ""
  end
end
