class ProfilesController < ApplicationController
  def show
      @user = User.find(params[:id])
       @upcoming_events = Event.where('date >= ?', Date.today).order(:date).limit(5)
  end
end
