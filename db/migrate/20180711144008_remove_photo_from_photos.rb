class RemovePhotoFromPhotos < ActiveRecord::Migration[5.2]
  def change
    remove_column :photos, :photo, :string
  end
end
