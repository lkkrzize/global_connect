class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    # for review on show page
    @review = Review.new
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      redirect_to @event
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @event = Event.find(params[:id])
    return redirect_to @event, alert: "Only event organiser can edit the event" unless @event.user == current_user
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
    params.require(:event).permit(:name, :location, :description, :people_limit, :date, :starts_at, :ends_at, :photo)
  end

end
