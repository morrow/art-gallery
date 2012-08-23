class Visit < ActiveRecord::Base

  attr_accessible :days, :hours, :address

  has_and_belongs_to_many :images

end
