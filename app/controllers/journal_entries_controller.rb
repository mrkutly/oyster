class JournalEntriesController < ApplicationController

  def create
    @journal_entry = JournalEntry.new(journal_entry_params)

    if @journal_entry.save
      redirect_to trip_path(@journal_entry.trip)
    else
      render :new
    end
  end

  def show
    set_journal_entry
    @trip = @journal_entry.trip
  end

  private
  def journal_entry_params
    params.require(:journal_entry).permit(:title, :content, :trip_id, :location_id)
  end

  def set_journal_entry
    @journal_entry = JournalEntry.find(params[:id])
  end
end
