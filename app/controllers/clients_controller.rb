class ClientsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  before_action :require_client_as_self, only: %i[edit update destroy]

  def index
    @clients = Client.all_by_albums
  end

  def new
    @user = Client.new
    session[:account_type] = 'Client'
  end

  def create
    @user = Client.create(client_params)
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to client_path(@user)
    else
      render :new
    end
  end

  def show
    @client = Client.find_by(id: params[:id])
    @albums = @client.albums
  end

  def edit
    @user = Client.find_by(id: params[:id])
  end

  def update
    @user = Client.find_by(id: params[:id])

    unless @user.email == client_params[:email] || Client.find_by(email: client_params[:email]).nil?
      flash.now.notice = 'Invalid email'
      render :edit
      return
    end

    @user.update(client_params)
    if @user.valid?
      redirect_to client_path(@user), notice: 'Client successfully updated!'
    else
      render :edit
    end
  end

  def destroy
    @client = Client.find_by(id: params[:id])
    @client.destroy
    %i[user_id account_type].each { |k| session.delete(k) }
    redirect_to root_path, notice: 'Client and all associated Albums were deleted!'
  end

  private

  def client_params
    params.require(:client).permit(:username, :password, :password_confirmation, :email, :location, :uid, :provider)
  end
end
