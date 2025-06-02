class EventUsersController < ApplicationController
before_action :authenticate_user!

  def create
    @event = Event.find(params[:event_id])
    @event.event_users.create(user: current_user)

  end

  def destroy
    @event_user = EventUser.find(params[:id])
    @event_user.destroy
  end
end
