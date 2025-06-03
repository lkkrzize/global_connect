module EventsHelper
  def user_registered?(event, user)
    event.event_users.exists?(user: user)
  end

  def event_owner?(event, user)
    event.user == user
  end

end

