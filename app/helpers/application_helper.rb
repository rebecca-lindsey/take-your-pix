module ApplicationHelper
  def current_photographer
    current_photographer ||= Photographer.find_by(id: session[:photographer_id])
  end

  def current_client
    current_photographer ||= Client.find_by(id: session[:client_id])
  end

  def logged_in?
    current_photographer || current_client
  end

  def require_login
    redirect_to login_path unless logged_in?
  end

  def require_photographer
    redirect_to login_path unless current_photographer
  end

  def require_client
    redirect_to login_path unless current_client
  end

  def display_profile_link
    if current_photographer
      link_to 'Your Profile', photographer_path(current_photographer)
    else
      link_to 'Your Profile', client_path(current_client)
    end
  end
end
