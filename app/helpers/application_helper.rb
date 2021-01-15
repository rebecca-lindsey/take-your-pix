module ApplicationHelper
  def current_photographer
    current_photographer ||= Photographer.find_by(id: session[:photographer_id])
  end

  def current_client
    current_photographer ||= Photographer.find_by(id: sesssion[:photographer_id])
  end
end
