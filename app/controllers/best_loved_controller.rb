class BestLovedController < ApplicationController
  def index
    @top_albums = Album.select_top.to_a
    @top_photographers = Photographer.select_top.to_a
    @top_clients = Client.select_top.to_a
  end
end
