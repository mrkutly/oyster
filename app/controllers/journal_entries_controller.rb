class JournalEntriesController < ApplicationController
  def new
    @journal_entry = JournalEntry.new
  end

  def create
    @journal_entry = JournalEntry.new(journal_entry_params)

    if @journal_entry.save
      redirect_to journal_entry_path(@journal_entry)
    else
      render :new
    end
  end

  def show
    set_journal_entry
  end

  private
  def journal_entry_params
    params.require(:journal_entry).permit(:title, :content, :trip_id, :location_id)
  end

  def set_journal_entry
    @journal_entry = JournalEntry.find(params[:id])
  end
end
