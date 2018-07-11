class PhotoAlbumsController < ApplicationController
  def show
    set_photos
    @photo = Photo.new
  end

  def create
    @photo_album.new(photo_album_params)
  end

  private
  def photo_album_params
    params.require(:photo_album).permit(:trip_id)
  end

  def set_photos
    @photo_album = PhotoAlbum.find(params[:id])
    @photos = @photo_album.photos
  end
end
