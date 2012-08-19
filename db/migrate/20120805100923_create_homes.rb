class CreateHomes < ActiveRecord::Migration
  def change
    create_table :homes do |t|
      t.string :title
      t.string :subtitle
      t.text :text
      t.references :image

      t.timestamps
    end
  end
end
