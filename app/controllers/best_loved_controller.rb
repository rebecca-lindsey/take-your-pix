class BestLovedController < ApplicationController
  def index
    @album_count = Album.highest_photo_count
    @albums = Album.with_most_photos(@album_count).to_a
  end
end
