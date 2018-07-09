class PhotoAlbum < ApplicationRecord
  belongs_to :trip
  has_many :photos
end
