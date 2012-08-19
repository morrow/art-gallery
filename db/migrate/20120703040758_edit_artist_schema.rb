class EditArtistSchema < ActiveRecord::Migration
  def up
    remove_column :artists, :exhibits_id
    remove_column :artists, :paintings_id
    rename_column :artists, :url, :website
  end

  def down
  end
end
