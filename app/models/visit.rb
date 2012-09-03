class Visit < ActiveRecord::Base

  attr_accessible :days, :hours, :address, :image_id

  belongs_to :image

end
