class CreateJournalEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :journal_entries do |t|
      t.string :title
      t.text :content
      t.integer :trip_id
      t.integer :location_id

      t.timestamps
    end
  end
end
