class AddCommentToPhotos < ActiveRecord::Migration[5.2]
  def change
    add_column :photos, :comment, :string
  end
end
