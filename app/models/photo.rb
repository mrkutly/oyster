class Photo < ApplicationRecord
  belongs_to :photo_album
  belongs_to :location
  mount_uploader :photo, PhotoUploader

  ### remove this line for postgresql ###
  serialize :photos, JSON
end
