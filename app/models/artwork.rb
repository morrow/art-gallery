class Artwork < ActiveRecord::Base
  belongs_to :exhibit
  belongs_to :artist
end
