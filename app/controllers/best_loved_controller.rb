class BestLovedController < ApplicationController
  def index
    @top_albums = Album.select_top
    @top_photographers = Photographer.select_top
    @top_clients = Client.select_top
  end
end
