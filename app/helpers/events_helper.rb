module EventsHelper
  def user_registered?(event, user)
    event.event_users.exists?(user: user)
  end

  def event_owner?(event, user)
    event.user == user
  end

  def event_banner_image(event)
    if event.photo.attached?
      url_for(event.photo)
    else
      # Fallback to a consistent random image from Picsum for this event
      # if event.photo is not attached and event.image_url was removed.
      "https://picsum.photos/seed/#{event.name}/600/400"
    end
  end
end
