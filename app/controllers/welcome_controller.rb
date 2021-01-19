class WelcomeController < ApplicationController
  skip_before_action :require_login
  # layout 'guest'
  def index
  end
end
