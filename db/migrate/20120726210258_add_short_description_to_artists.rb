class AddShortDescriptionToArtists < ActiveRecord::Migration
  def change
    add_column :artists,  :short_description, :text
  end
end
