class AddDirectionsToVisit < ActiveRecord::Migration
  def change
    add_column :visits, :directions_text, :text
    add_column :visits, :directions_link, :string
  end
end
