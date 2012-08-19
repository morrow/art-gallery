class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.string :hours
      t.string :days
      t.text :address

      t.timestamps
    end
  end
end
