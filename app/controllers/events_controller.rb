class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :search]

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

  def search
    if params[:location].present?
      # Manual location search
      coordinates = Geocoder.search(params[:location]).first&.coordinates
      if coordinates
        lat, lng = coordinates
        @events = Event.near([lat, lng], 50, units: :km)
      else
        @events = Event.none
        flash.now[:alert] = "Location not found"
      end
    elsif params[:sw_lat] && params[:ne_lat] && params[:sw_lng] && params[:ne_lng]
      # User location or map bounds search
      sw_lat = params[:sw_lat].to_f
      sw_lng = params[:sw_lng].to_f
      ne_lat = params[:ne_lat].to_f
      ne_lng = params[:ne_lng].to_f

      @events = Event.where(latitude: sw_lat..ne_lat, longitude: sw_lng..ne_lng)
    else
      @events = Event.all
    end

    render :index
  end

  def chat
    @event = Event.find(params[:id])
    @message = Message.new
    if @event.event_users.find_by(user_id: current_user.id).nil?
      redirect_to event_path(@event)
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :location, :description, :people_limit, :date, :starts_at, :ends_at, :photo)
  end
end
