class RemoveNameFromPhotoAlbums < ActiveRecord::Migration[5.2]
  def change
    remove_column :photo_albums, :name, :string
  end
end
