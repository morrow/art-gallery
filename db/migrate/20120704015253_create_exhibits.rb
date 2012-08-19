class CreateExhibits < ActiveRecord::Migration
  def change
    create_table :exhibits do |t|
      t.string :name
      t.references :artist
      t.string :description
      t.integer :year
      t.datetime :start
      t.datetime :end
      t.string :hours

      t.timestamps
    end
    add_index :exhibits, :artist_id
  end
end
