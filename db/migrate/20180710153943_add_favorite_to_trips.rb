class AddFavoriteToTrips < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :favorite, :boolean
  end
end
