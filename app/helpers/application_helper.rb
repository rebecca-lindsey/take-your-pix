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

  def clean_time(date)
    date.strftime('%A, %B %d, %Y')
  end
end
