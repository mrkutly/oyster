class TripsController < ApplicationController

  def create
  end

  def show
    set_trip
  end

  def edit
    set_trip
  end

  def update
    set_trip
  end

  def destroy
    set_trip
    @trip.destroy
    redirect_to home_path(current_user)
  end

  private
  def trip_params
    params.require(:trips).permit(:name)
  end

  def set_trip
    @trip = Trip.find(params[:id])
  end
end