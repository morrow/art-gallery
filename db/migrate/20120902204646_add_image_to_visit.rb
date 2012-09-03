class AddImageToVisit < ActiveRecord::Migration
  def change
    drop_table :images_visits
    add_column :visits, :image_id, :integer
  end
end
