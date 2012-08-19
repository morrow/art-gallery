class AddSlugs < ActiveRecord::Migration
  def up
    add_column :artists, :slug, :string
    add_column :artworks, :slug, :string
    add_column :exhibits, :slug, :string
    
    add_index :artists, :slug, unique: true
    add_index :artworks, :slug, unique: true
    add_index :exhibits, :slug, unique: true
  end

  def down
     remove_index :artists, :slug
     remove_index :artworks, :slug
     remove_index :exhibits, :slug
     remove_column :artists, :slug
     remove_column :artworks, :slug
     remove_column :exhibits, :slug
  end
end
