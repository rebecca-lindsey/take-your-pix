class SessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create omniauth]
  before_action :redirect_if_logged_in, only: %i[new create omniauth]

  def new; end

  def create
    account_type = session[:account_type]
    redirect_to login_path unless account_type == 'Photographer' || account_type == 'Client'
    if user = account_type.constantize.find_by(email: params[:user][:email])&.authenticate(params[:user][:password])
      session[:user_id] = user.id
      if account_type == 'Photographer'
        redirect_to photographer_path(user)
      else
        redirect_to client_path(user)
      end
    else
      redirect_to login_path
    end
  end

  def omniauth
    account_type = session[:account_type]
    user = account_type.constantize.from_omniauth(account_type, request.env['omniauth.auth'])
    if user.valid?
      session[:user_id] = user.id
      if account_type == 'Photographer'
        redirect_to photographer_path(user)
      else
        redirect_to client_path(user)
      end
    else
      redirect_to '/login'
    end
  end

  def destroy
    %i[user_id account_type].each { |k| session.delete(k) }
    byebug
    redirect_to root_path
  end

  private

  def redirect_if_logged_in
    if current_photographer
      redirect_to photographer_path(current_photographer), notice: 'You are already logged in, please logout before trying that action'
    elsif current_client
      redirect_to client_path(current_client), notice: 'You are already logged in, please logout before trying that action'
    end
  end
end
