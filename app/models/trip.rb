class Trip < ApplicationRecord
  belongs_to :user
  has_one :photo_album
  has_many :photos, through: :photo_album
  has_many :trip_locations
  has_many :locations, through: :trip_locations
  has_many :journal_entries

  validates :name, presence: true
  validates :user_id, numericality: { only_integer: true }
end
