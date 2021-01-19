class PhotographersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  include PhotographersHelper
  include UsersHelper

  def index
    @photographers = Photographer.all
  end

  def new
    @user = Photographer.new
    session[:account_type] = 'Photographer'
  end

  def create
    @user = Photographer.create(photographer_params)
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to photographer_path(@user)
    else
      render new_photographer_path
    end
  end

  def show
    @photographer = Photographer.find_by(id: params[:id])
    @albums = @photographer.albums
    @clients = @photographer.clients
  end

  def edit
    @photographer = current_photographer
  end

  def update
    @photographer = current_photographer
    @photographer.update(photographer_params)
    if @photographer.valid?
      redirect_to photographer_path(@photographer)
    else
      render edit_photographer_path
    end
  end

  def destroy
    @photographer = Photographer.find_by(id: params[:id])
    @photographer.destroy
    session.delete :photographer_id
    redirect_to root_path
  end

  private

  def photographer_params
    params.require(:photographer).permit(:username, :password, :password_confirmation, :email, :location, :specialty, :uid, :provider)
  end
end
