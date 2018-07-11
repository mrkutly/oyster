class Photo < ApplicationRecord
  belongs_to :photo_album
  belongs_to :location
  mount_uploader :image, ImageUploader

  ### remove this line for postgresql ###
end
