class ChangeDefaultValueOnUrlsViewCount < ActiveRecord::Migration[5.1]
  def change
    change_column :urls, :view_count, :integer, default: 0
  end
end
