class AddImagesToVisit < ActiveRecord::Migration
  def self.up
    create_table :images_visits, :id => false do |t|
      t.references :image
      t.references :visit
    end
    add_index :images_visits, [:image_id, :visit_id]
    add_index :images_visits, [:visit_id, :image_id]
  end

  def self.down
    drop_table :images_visits
  end
end
