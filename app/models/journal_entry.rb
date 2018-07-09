class JournalEntry < ApplicationRecord
  belongs_to :trip
  belongs_to :location, optional: true
end
