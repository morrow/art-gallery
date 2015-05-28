class Image < ActiveRecord::Base

  #attr_accessible :name, :image, :category_id

  belongs_to :artist
  belongs_to :category

  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  has_attached_file :image

  def to_s
    self.image
  end

  validates_uniqueness_of :name, :scope => :category_id

end
