class PhotographersController < ApplicationController
  skip_before_action :require_login

  def new
    @photographer = Photographer.new
  end

  def create
    @photographer = Photographer.create(photographer_params)
    if @photographer.valid?
      byebug
      redirect_to photographer_path(@photographer)
    else
      render new_photographer_path
    end
  end

  def show
    @photographer = current_photographer
  end

  private

  def photographer_params
    params.require(:photographer).permit(:username, :password, :email, :location, :specialty)
  end
end
