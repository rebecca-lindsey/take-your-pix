module ApplicationHelper
  def current_photographer
    current_photographer ||= Photographer.find_by(id: session[:photographer_id])
  end

  def current_client
    current_photographer ||= Photographer.find_by(id: session[:photographer_id])
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

  def display_nav_links
    byebug
    if logged_in?
      link_to 'All Photographers', photographers_path
      link_to 'All Clients', clients_path
      display_profile_link
      link_to 'Logout', logout_path, method: :delete
    else
      link_to 'Login', login_path
      link_to 'Signup as Photographer', new_photographer_path
      link_to 'Signup as Client', new_client_path
    end
  end
end
