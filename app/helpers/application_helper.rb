module ApplicationHelper

  def pages_home
    'landing'
  end

  def event_banner_image(event)
    # checking if photo attached to stop page crashing and use placeholder if no image attached
    if event.photo.attached?
      cl_image_path(event.photo.key)
    else
      "https://raw.githubusercontent.com/lewagon/fullstack-images/master/uikit/background.png"
    end
  end
  
end
