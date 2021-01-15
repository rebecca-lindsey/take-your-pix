class PhotographersController < ApplicationController
    skip_before_action :require_login
  def show
    @photographer = current_photographer
  end
end
