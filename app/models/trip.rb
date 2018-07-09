class Trip < ApplicationRecord
  belongs_to :user
  has_many :photo_albums
  has_many :photos, through: :photo_albums
  has_many :trip_locations
  has_many :locations, through: :trip_locations
  has_many :journal_entries
end
