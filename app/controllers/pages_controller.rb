class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

    def search
      location = params[:location]

      # Use Geocoder or other service to get lat/lon from location string
      results = Geocoder.search(location)
      if results.present?
        lat = results.first.latitude
        lon = results.first.longitude

        # Redirect to the event show page with coordinates
        redirect_to events_show_path(lat: lat, lon: lon)
      else
        flash[:alert] = "Location not found."
        redirect_to root_path
      end
    end

  def home
     @events = Event.all
     @markers = @events.geocoded.map do |event|
    {
      lat: event.latitude,
      lng: event.longitude,
      name: event.name,
      details: event.description.truncate(100)
    }
    end
  end
end
