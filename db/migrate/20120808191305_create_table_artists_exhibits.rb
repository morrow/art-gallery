class CreateTableArtistsExhibits < ActiveRecord::Migration
  def self.up
    create_table :artists_exhibits, :id => false do |t|
      t.references :artist
      t.references :exhibit
    end
    add_index :artists_exhibits, [:artist_id, :exhibit_id]
    add_index :artists_exhibits, [:exhibit_id, :artist_id]
  end

  def self.down
    drop_table :artists_exhibits
  end
end
