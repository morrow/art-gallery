class CleanupVisit < ActiveRecord::Migration
  def change
    remove_column :visits, :direction_text
    remove_column :visits, :direction_link
  end
end
