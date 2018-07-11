class RemoveLocationIdFromJournalEntries < ActiveRecord::Migration[5.2]
  def change
    remove_column :journal_entries, :location_id, :integer
  end
end
