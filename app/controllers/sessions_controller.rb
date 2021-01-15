class SessionsController < ApplicationController
  def new; end

  def create
    byebug
    if @photographer = Photographer.find_by(email: params[:user][:email])&.authenticate(params[:user][:password])
      session[:photographer_id] = @photographer.id
      redirect_to photographer_path(@photographer)
    elsif @client = Client.find_by(email: params[:user][:email])
      session[:client_id] = @client.id
      redirect_to client_path(@client)
    else
      render 'new'
    end
  end

  def destroy
    session.delete :photographer_id unless session[:photographer_id].nil?
    session.delete :client_id unless session[:client_id].nil?
    redirect_to root_path
  end
end
