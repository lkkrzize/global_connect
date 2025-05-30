class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def register
    @event = Event.find(params[:id])
    @event.event_users.create(user: current_user)
    redirect_to @event
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
  def search
    if params[:sw_lat] && params[:ne_lat]
      # Search using map bounds
      sw_lat = params[:sw_lat].to_f
      sw_lng = params[:sw_lng].to_f
      ne_lat = params[:ne_lat].to_f
      ne_lng = params[:ne_lng].to_f

      @events = Event.where(latitude: sw_lat..ne_lat, longitude: sw_lng..ne_lng)
    elsif params[:location]
      # Use geocoding to get lat/lng from location string
      coordinates = Geocoder.search(params[:location]).first&.coordinates
      if coordinates
        lat, lng = coordinates
        @events = Event.near([lat, lng], 50) # 50 miles or km
      else
        @events = Event.none
        flash.now[:alert] = "Location not found"
      end
    else
      @events = Event.all
    end

    render :index
  end

  private

  def event_params
    params.require(:event).permit(:name, :location, :description, :people_limit, :date, :starts_at, :ends_at)
  end

end
