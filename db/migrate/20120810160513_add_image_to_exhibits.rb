class AddImageToExhibits < ActiveRecord::Migration
  def change
    add_column :exhibits, :image_id, :integer
  end
end
