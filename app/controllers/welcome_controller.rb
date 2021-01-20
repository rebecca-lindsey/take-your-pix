class WelcomeController < ApplicationController
  skip_before_action :require_login
  def index; end

  def create
    session[:account_type] = params[:user][:account_type]
    redirect_to login_path
  end
end
