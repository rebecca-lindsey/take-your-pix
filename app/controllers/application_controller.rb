class ApplicationController < ActionController::Base
  before_action :require_login
  include ApplicationHelper
  layout :determine_layout

  private

  def determine_layout
    logged_in? ? 'application' : 'guest'
  end
end
