class TripsController < ApplicationController
  before_action :authorized

  def create
    @trip = Trip.new(trip_params)

    if @trip.save
      redirect_to trip_path(@trip)
    else
      flash[:new_trip_notice] = "Please fill in all fields"
      redirect_to home_path(current_user)
    end
  end

  def show
    if !params[:trip].nil?
      search_trip
    else
      set_trip
    end

    if @trip.nil?
      flash[:search_notice] = "Could not find a trip by that name"
      redirect_to home_path(current_user)
    else
      set_show

      if @photo_album.nil?
        @photo_album = PhotoAlbum.new
      end
    end
  end

  def edit
    set_trip
  end

  def update
    set_trip

    if @trip.update(trip_params)
      redirect_to trip_path(@trip)
    else
      render :edit
    end
  end

  def destroy
    set_trip
    @trip.destroy
    redirect_to home_path(current_user)
  end

  private
  def trip_params
    params.require(:trip).permit(:name, :user_id, :favorite, :description)
  end

  def set_trip
    @trip = Trip.find(params[:id])
  end

  def search_trip
    @trip = Trip.find_by(name: params[:trip][:name])
  end

  def set_show
    @photo_album = @trip.photo_album
    @photos = @trip.photos
    @journal_entry = JournalEntry.new
    @journal_entries = JournalEntry.where(trip_id: @trip.id)
  end
end
