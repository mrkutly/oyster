class JournalEntry < ApplicationRecord
  belongs_to :trip
  belongs_to :location, optional: true

  validates :title, presence: true
  validates :content, presence: true
end
