class PhotoAlbumsController < ApplicationController
  def show
    set_photos
  end

  private
  def set_photos
    photo_album = PhotoAlbum.find(params[:id])
    @photos = photo_album.photos
  end
end
