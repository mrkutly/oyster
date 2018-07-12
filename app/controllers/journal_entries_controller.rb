class JournalEntriesController < ApplicationController
  before_action :authorized

  def create
    @journal_entry = JournalEntry.new(journal_entry_params)

    if @journal_entry.save
      redirect_to trip_path(@journal_entry.trip)
    else
      flash[:notice] = "Uh oh! You forgot something"
      redirect_to trip_path(journal_entry_params[:trip_id])
    end
  end

  def show
    set_journal_entry
    @trip = @journal_entry.trip
  end

  def destroy
    set_journal_entry
    trip = @journal_entry.trip
    @journal_entry.destroy
    redirect_to trip_path(trip)
  end

  def edit
    set_journal_entry
    @trip = @journal_entry.trip
  end

  def update
    set_journal_entry
    @journal_entry.update(journal_entry_params)
    redirect_to journal_entry_path(@journal_entry)
  end

  private
  def journal_entry_params
    params.require(:journal_entry).permit(:title, :content, :trip_id, :location_id)
  end

  def set_journal_entry
    @journal_entry = JournalEntry.find(params[:id])
  end
end
