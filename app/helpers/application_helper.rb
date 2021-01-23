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

  def valid_album
    album = Album.find_by(id: params[:album_id])
    if session[:account_type] == 'Photographer'
      return true if album.nil? || album.photographer == current_photographer
    elsif session[:account_type] == 'Client'
      return true if album.nil? || album.client == current_client
    end
    false
  end

  def clean_time(date)
    date.strftime('%A, %B %d, %Y')
  end
end
