module ApplicationHelper
  def current_photographer
    current_photographer ||= Photographer.find_by(id: session[:user_id]) if session[:account_type] == 'Photographer'
  end

  def current_client
    current_client ||= Client.find_by(id: session[:user_id]) if session[:account_type] == 'Client'
  end

  def logged_in?
    current_photographer || current_client
  end

  def require_login
    redirect_to login_path unless logged_in?
  end

  def require_photographer
    redirect_to client_path(Client.find_by(id: session[:client_id])) unless current_photographer
  end

  def display_profile_link
    if current_photographer
      link_to 'Your Profile', photographer_path(current_photographer)
    else
      link_to 'Your Profile', client_path(current_client)
    end
  end

  def clean_time(date)
    date.strftime('%A, %B %d, %Y')
  end
end
