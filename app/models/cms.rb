class Cms < ActiveRecord::Base

  extend FriendlyId
  friendly_id :key, use: :slugged
  
  def normalize_friendly_id(string)
    "#{self.category}/#{self.key}".downcase
  end

end
