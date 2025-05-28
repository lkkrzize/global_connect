class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
    redirect_to edit_event_path(@event), alert: "Only event organiser can edit the event" unless @event.user == current_user
  end

  def update
    @event = Event.find(params[:id])
    if @event.user != current_user
      redirect_to event_path(@event), alert: "You can not change event details"
    elsif @event.update(event_params)
      redirect_to event_path(@event), notice: "Event has been updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :location, :description, :people_limit, :date, :starts_at, :ends_at)
  end
end
