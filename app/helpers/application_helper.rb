module ApplicationHelper

  def pages_home
    'landing'
  end

  # checking if photo attached to stop page crashing and use placeholder if no image attached
  def event_banner_image(event)
    if event.photo.attached?
      cl_image_path(event.photo.key)
    else
      "https://raw.githubusercontent.com/lewagon/fullstack-images/master/uikit/background.png"
    end
  end

  # met
  def user_avatar_image(user)
    if user.photo.attached?
      cl_image_path(user.photo.key)
    else
      "user-placeholder.png"
    end
  end
end
