class RemoveArtistIdFromExhibit < ActiveRecord::Migration
  def up
    remove_column :exhibits, :artist_id
  end

  def down
    add_column :exhibits, :artist_id, :integer
  end
end
