class ApplicationController < ActionController::Base
  before_action :require_login
  include ApplicationHelper
  layout :determine_layout

  private

  def determine_layout
    logged_in? ? 'application' : 'guest'
  end

  def require_login
    redirect_to root_path, notice: 'You must login before viewing that page' unless logged_in?
  end

  def require_photographer
    unless current_photographer
      redirect_to client_path(Client.find_by(id: session[:client_id])), notice: 'Only Photographers may view this page'
    end
  end
end
