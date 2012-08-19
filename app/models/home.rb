class Home < ActiveRecord::Base

  before_save :process_text

  attr_accessible :title, :subtitle, :text, :image_id

  belongs_to :image

  def process_text
  end

end