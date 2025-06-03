class ProfilesController < ApplicationController
  def show
      @user = User.find(params[:id])
       @next_event = Event.where('date >= ?', Date.today).order(:date).first 
       @upcoming_events = Event.where('date >= ?', Date.today).order(:date).limit(5)
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to profile_path(@user), notice: 'Profile updated successfully.'
    else
      render :show, alert: 'Failed to update profile.'
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :bio)
  end
end
