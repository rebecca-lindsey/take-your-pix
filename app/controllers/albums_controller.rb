class AlbumsController < ApplicationController
  def index
    @albums = Album.all
  end

  def new
    @album = Album.new
    @photographer = current_photographer
  end

  def create
    @photographer = current_photographer
    if current_photographer.albums.build(album_params).save
      @album = current_photographer.albums.last
      redirect_to album_path(@album)
    else
      render new_album_path
    end
  end

  def show
    @album = Album.find_by(id: params[:id])
    @photos = @album.photos
    @client = @album.client
    @photographer = @album.photographer
  end

  def edit
    @album = Album.find_by(id: params[:id])
    @photographer = @album.photographer
  end

  def update
    @album = Album.find_by(id: params[:id])
    @album.update(album_params)
    if @album.valid?
      redirect_to album_path(@album)
    else
      render edit_album_path
    end
  end

  private

  def album_params
    params.require(:album).permit(:title, :description, :date, :location, :photographer_id, :client_id)
  end
end
