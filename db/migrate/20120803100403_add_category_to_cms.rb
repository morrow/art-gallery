class AddCategoryToCms < ActiveRecord::Migration
  def change
    add_column :cms, :category, :string
  end
end
