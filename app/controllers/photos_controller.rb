class PhotosController < ApplicationController
  before_action :authorized

  def show
    set_photo
  end

  def create
    @photo = Photo.new(photo_params)

    if @photo.save
      @photo.store_image!
    else
      flash[:notice] = "Uh oh! You forgot something"
      @photo_album = PhotoAlbum.find(photo_params[:photo_album_id])
    end
    redirect_to photo_album_path(@photo.photo_album)
  end

  def destroy
    set_photo
    album = @photo.photo_album
    @photo.destroy
    redirect_to photo_album_path(album)
  end

  private
  def set_photo
    @photo = Photo.find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:image, :description, :photo_album_id)
  end
end
