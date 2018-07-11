class Location < ApplicationRecord
  has_many :trip_locations
  has_many :trips, through: :trip_locations
  has_many :journal_entries
end
