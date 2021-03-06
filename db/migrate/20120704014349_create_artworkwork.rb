class CreateArtworkwork < ActiveRecord::Migration
  def change
    create_table :artworkwork do |t|
      t.string :name
      t.text :description
      t.integer :image_id
      t.references :exhibit
      t.references :artist
      t.datetime :date
      t.integer :year
      t.string :location
      t.string :medium
      t.string :size

      t.timestamps
    end
    add_index :artworkwork, :exhibit_id
    add_index :artworkwork, :artist_id
  end
end
