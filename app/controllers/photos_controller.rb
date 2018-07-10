class PhotosController < ApplicationController

  def new
    @photo = Photo.new
  end

  def show
    @photo = Photo.find(params[:id])
    byebug
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.store_image!

    if @photo.save
      redirect_to photo_path(@photo)
    else
      render :new
    end
  end

  private
  def photo_params
    params.require(:photo).permit(:image, :description, :location_id, :photo_album_id)
  end
end
