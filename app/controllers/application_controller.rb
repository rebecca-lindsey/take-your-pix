class ApplicationController < ActionController::Base
  before_action :require_login
  include ApplicationHelper
end
