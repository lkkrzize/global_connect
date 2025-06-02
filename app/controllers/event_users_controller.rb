class EventUsersController < ApplicationController
before_action :authenticate_user!

  def create
    @event = Event.find(params[:event_id])
    @event.event_users.create!(user: current_user)

    redirect_to @event
  end

  def destroy
    @event_user = EventUser.find(params[:id])
    @event_user.destroy
    redirect_to @event_user.event
  end
end
