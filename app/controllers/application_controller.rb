class ApplicationController < ActionController::Base
  before_action :require_login
  include ApplicationHelper
  layout :determine_layout

  def routing_error
    render file: Rails.public_path.join('404.html'), status: :not_found, layout: false
  end

  private

  def determine_layout
    logged_in? ? 'application' : 'guest'
  end

  def require_login
    redirect_to root_path, notice: 'You must login before viewing that page' unless logged_in?
  end

  def require_photographer_as_self
    unless session[:account_type] == 'Photographer' && session[:user_id].to_s == params[:id] || valid_album
      if session[:account_type] == 'Photographer'
        redirect_to photographer_path(current_photographer), notice: 'You can only modify your own things'
      else
        redirect_to client_path(current_client), notice: 'You can only modify your own things. You are currently logged in as a Client.'
      end
    end
  end

  def require_client_as_self
    unless session[:account_type] == 'Client' && session[:user_id].to_s == params[:id] || valid_album
      if session[:account_type] == 'Client'
        redirect_to client_path(current_client), notice: 'You can only modify your own things'
      else
        redirect_to photographer_path(current_photographer), notice: 'You can only modify your own things. You are currently logged in as a Photographer.'
      end
    end
  end
end
