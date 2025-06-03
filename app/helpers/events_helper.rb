module EventsHelper
  def user_registered?(event, user)
    event.users.exists?(user.id)
  end
end