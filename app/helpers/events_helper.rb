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
    elsif event.image_url.present?
      event.image_url
    else
      "https://picsum.photos/seed/#{event.id}/600/400"
    end
  end
end
