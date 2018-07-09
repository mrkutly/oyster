class CreatePhotoAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :photo_albums do |t|
      t.string :name
      t.integer :trip_id

      t.timestamps
    end
  end
end
