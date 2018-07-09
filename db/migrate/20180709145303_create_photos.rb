class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.integer :photo_album_id
      t.string :photo
      t.integer :location_id

      t.timestamps
    end
  end
end
