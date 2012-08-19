class AddMediaToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :media, :string
  end
end
