class PhotographersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  before_action :require_photographer_as_self, only: %i[edit update destroy]

  def index
    @photographers = Photographer.all_by_albums.to_a
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
      render :new
    end
  end

  def show
    @photographer = Photographer.find_by(id: params[:id])
    @albums = @photographer.albums
    @clients = @photographer.clients
  end

  def edit
    @user = current_photographer
  end

  def update
    @user = current_photographer
    unless @user.email == photographer_params[:email] || Photographer.find_by(email: photographer_params[:email]).nil?
      flash.now.notice = 'Invalid email'
      render :edit
      return
    end

    @user.update(photographer_params)
    if @user.valid?
      redirect_to photographer_path(@user), notice: 'Photographer successfully updated!'
    else
      render :edit
    end
  end

  def destroy
    @photographer = Photographer.find_by(id: params[:id])
    @photographer.destroy
    %i[user_id account_type].each { |k| session.delete(k) }
    redirect_to root_path, notice: 'Photographer and associated Albums were deleted!'
  end

  private

  def photographer_params
    params.require(:photographer).permit(:username, :password, :password_confirmation, :email, :location, :specialty, :uid, :provider)
  end
end
