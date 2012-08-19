class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.string :biography
      t.string :url
      t.references :image
      t.references :exhibits
      t.references :paintings
      t.string :email
      t.string :facebook
      t.string :twitter
      t.string :phone

      t.timestamps
    end
    add_index :artists, :image_id
    add_index :artists, :exhibits_id
    add_index :artists, :paintings_id
  end
end
