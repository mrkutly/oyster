class RemoveLocationIdFromPhotos < ActiveRecord::Migration[5.2]
  def change
    remove_column :photos, :location_id, :integer
  end
end
