class PhotosController < ApplicationController

  def new
    @photo = Photo.new
  end

  def create
    byebug
  end

end
