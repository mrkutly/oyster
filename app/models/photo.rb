class Photo < ApplicationRecord
  belongs_to :photo_album
  mount_uploader :image, ImageUploader

  ### remove this line for postgresql ###
end
