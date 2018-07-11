class DropTripsLocations < ActiveRecord::Migration[5.2]
  def change
    drop_table :trips_locations
  end
end
