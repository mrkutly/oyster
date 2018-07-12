class Photo < ApplicationRecord
  belongs_to :photo_album
  mount_uploader :image, ImageUploader
  validates :image, presence: true

  ### remove this line for postgresql ###
end
