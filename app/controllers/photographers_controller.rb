class PhotographersController < ApplicationController
  skip_before_action :require_login, only: :new

  def new
    @photographer = Photographer.new
  end

  def create
    @photographer = Photographer.create(photographer_params)
    if @photographer.valid?
      redirect_to photographer_path(@photographer)
    else
      render new_photographer_path
    end
  end

  def show
    @photographer = current_photographer
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

  private

  def photographer_params
    params.require(:photographer).permit(:username, :password, :password_confirmation, :email, :location, :specialty)
  end
end
