class PhotosController < ApplicationController

  def new
    @photo = Photo.new
  end

  def show
    set_photo
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.store_image!

    if @photo.save
      redirect_to photo_album_path(@photo.photo_album)
    else
      @photo_album = PhotoAlbum.find(photo_params[:photo_album_id])
      render "photos/_new_form"
    end
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
