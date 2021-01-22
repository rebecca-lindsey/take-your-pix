class AlbumsController < ApplicationController
  before_action :require_photographer_as_self
  skip_before_action :require_photographer_as_self, only: %i[index show destroy]

  def index
    @albums = Album.all
  end

  def new
    @album = Album.new
    @photographer = current_photographer
  end

  def create
    @photographer = current_photographer
    @album = current_photographer.albums.build(album_params)
    if @album.save
      redirect_to album_path(@album)
    else
      render :new
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
      render :edit
    end
  end

  def destroy
    @album = Album.find_by(id: params[:id])
    @album.destroy
    redirect_to albums_path
  end

  private

  def album_params
    params.require(:album).permit(:title, :description, :date, :location, :photographer_id, :client_id)
  end
end
