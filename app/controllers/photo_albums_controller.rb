class PhotoAlbumsController < ApplicationController
  def show
    set_photos
    @photo = Photo.new
  end

  def create
    byebug
    @photo_album = PhotoAlbum.new(photo_album_params)

    if @photo_album.save
      redirect_to photo_album_path(@photo_album)
    end
    #something here for errors?
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
