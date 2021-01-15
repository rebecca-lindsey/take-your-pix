class PhotographersController < ApplicationController
  def show
    @photographer = current_photographer
  end
end
