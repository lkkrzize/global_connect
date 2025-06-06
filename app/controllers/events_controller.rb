class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :search_by_location]


  def index
    search_by_location

    if params[:query].present?
      @events = Event.search_by_events_and_location(params[:query])
    end

    @markers = @events.geocoded.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {event: event })
      }
    end

    render :index
  end

  def show
    @event = Event.find_by(id: params[:id])
    if @event.nil?
      redirect_to events_path, alert: "Sorry, that event no longer exists."
    else
      @review = Review.new
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user

    # Combine date with time inputs
    combine_date_and_time

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
    else
      @event.assign_attributes(event_params)

      
      combine_date_and_time

      if @event.save
        redirect_to event_path(@event), notice: "Event has been updated"
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  def search_by_location
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
  end

  def chat
    @event = Event.find(params[:id])
    @message = Message.new
    # if @event.event_users.find_by(user_id: current_user.id).nil?
    unless @event.event_users.exists?(user_id: current_user.id) || @event.user_id == current_user.id
      redirect_to event_path(@event)
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path, notice: "Event deleted"
  end

  private

  def combine_date_and_time
    if @event.date.present? && params[:event][:starts_at].present? && params[:event][:ends_at].present?
      start_time = Time.parse(params[:event][:starts_at])
      end_time = Time.parse(params[:event][:ends_at])

      @event.starts_at = DateTime.new(
        @event.date.year,
        @event.date.month,
        @event.date.day,
        start_time.hour,
        start_time.min
      )

      @event.ends_at = DateTime.new(
        @event.date.year,
        @event.date.month,
        @event.date.day,
        end_time.hour,
        end_time.min
      )
    end
  end

  def event_params
    params.require(:event).permit(:name, :location, :description, :people_limit, :date, :photo, category_ids: [])
  end
end
