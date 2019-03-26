class Photo < ApplicationRecord
  belongs_to :photo_album
  mount_uploader :image, ImageUploader
  validates :image, presence: true
  validates :description, length: { maximum: 255 }

  ### remove this line for postgresql ###
end
