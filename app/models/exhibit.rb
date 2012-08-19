class Exhibit < ActiveRecord::Base

  attr_accessible :name, :artists, :description, :start, :end, :hours, :image_id

  has_and_belongs_to_many :artists

  belongs_to :image

  before_save :set_year

  extend FriendlyId
  friendly_id :name, use: :slugged

  def set_year
    self.year = Time.now.strftime "%Y"
  end

end
