class Visit < ActiveRecord::Base

  #attr_accessible :days, :hours, :address, :image_id, :description, :directions_link, :directions_text

  belongs_to :image

end
