class TripsController < ApplicationController
  before_action :authorized

  def create
    @trip = Trip.new(trip_params)

    if @trip.save
      redirect_to trip_path(@trip)
    else
      redirect_to home_path(current_user)
    end
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
    params.require(:trip).permit(:name, :user_id)
  end

  def set_trip
    @trip = Trip.find(params[:id])
  end
end
