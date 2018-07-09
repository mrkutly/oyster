class CreateTripsLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :trips_locations do |t|
      t.integer :trip_id
      t.integer :location_id

      t.timestamps
    end
  end
end
