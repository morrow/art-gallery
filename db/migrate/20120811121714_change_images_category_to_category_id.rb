class ChangeImagesCategoryToCategoryId < ActiveRecord::Migration
  def up
    remove_column :images, :category
    add_column :images, :category_id, :integer
  end

  def down
    remove_column :images, :category_id
    add_column :images, :category, :string
  end
end
