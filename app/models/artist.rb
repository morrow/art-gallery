class Artist < ActiveRecord::Base
  belongs_to :image
  belongs_to :paintings

  has_many :exhibits

  attr_accessible :name, :image, :image_id, :biography, :website, :email, :facebook, :twitter, :phone, :media, :short_description

  extend FriendlyId
  friendly_id :name, use: :slugged

  def first_name
    return self.name.split(' ').first
  end

  def last_name
    return self.name.split(' ').last
  end


end
