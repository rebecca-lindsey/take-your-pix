class BestLovedController < ApplicationController
  def index
    @album_count = Album.highest_photo_count
    @albums = Album.with_most_photos(@album_count).to_a
    @client_photographer_count = Client.highest_photographer_count
    @clients_top_photographer = Client.with_most_photographers(@client_photographer_count).to_a
    @photographer_album_count = Photographer.highest_album_count
    @photographers_top_album = Photographer.with_most_albums(@photographer_album_count).to_a
  end
end
