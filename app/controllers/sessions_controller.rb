class SessionsController < ApplicationController
  def new; end

  def create
    if @photographer = Photographer.find_by(email: params[:email])
      session[:user_id] = @photographer.id
      redirect_to photographer_path(@photographer)
    elsif @client = Client.find_by(email: params[:email])
      session[:user_id] = @client.id
      redirect_to client_path(@client)
    else
      render 'new'
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end
end
