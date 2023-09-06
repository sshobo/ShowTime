class ChangeDefaultValueOfViews < ActiveRecord::Migration[7.0]
  def change
    change_column_default :videos, :views, 0
  end
end
