class EventsController < ApplicationController
  def show
    @event = Event.find(params[:id])
  end

  def register
    @event = Event.find(params[:id])
    @event.event_users.create(user: current_user)
    redirect_to @event
  end
end
