class CreateUrls < ActiveRecord::Migration[5.1]
  def change
    create_table :urls do |t|
      t.string :original_url
      t.string :url
      t.integer :view_count
    end
  end
end
