class ProfilesController < ApplicationController
  # assigns the  id params to @user for show, edit and update
  before_action :set_user, only: [:show, :edit, :update]

  def show
    if @user == current_user
      @next_event = @user.next_event
      @upcoming_events = @user.upcoming_events
    else
      @next_event = nil
      @upcoming_events = []
    end
  end

  def edit
    redirect_to profile_path(@user), alert: "You can only edit your own profile!" unless @user == current_user
  end

  def update
    if @user == current_user
      if @user.update(user_params)
        redirect_to profile_path(@user), notice: "Your profile has been updated!"
      else
        render :edit, status: :unprocessable_entity
      end
    else
      redirect_to profile_path(@user), alert: "You have tried editing someone else profile"
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :profile_name, :email, :bio, :photo)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
