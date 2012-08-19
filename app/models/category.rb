class Category < ActiveRecord::Base

  has_many :images

  def display_name
    self.name.capitalize
  end

end
