class EditImages < ActiveRecord::Migration
  def change
    remove_column :images, :src
    add_column :images, :location, :string
    add_column :images, :slug, :string
  end
end
