class AddSocialFieldsToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :facebook, :string
    add_column :contacts, :twitter, :string
    add_column :contacts, :flickr, :string
    add_column :contacts, :instagram, :string
  end
end
