class User < ApplicationRecord
  has_many :trips
  has_many :journal_entries, through: :trips
  has_many :trip_locations, through: :trips
  has_many :locations, through: :trip_locations
  has_many :photo_albums, through: :trips
  has_many :photos, through: :photo_albums
  has_secure_password
  validates :email, uniqueness: true
  validates :password, length: { minimum: 6, maximum: 100 }
end
