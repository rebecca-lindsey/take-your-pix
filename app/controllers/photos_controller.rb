class PhotosController < ApplicationController
  before_action :require_photographer_as_self
  skip_before_action :require_photographer_as_self, only: %i[show destroy]

  def new
    @photo = Photo.new
    @album = Album.find_by(id: params[:album_id])
  end

  def create
    @album = Album.find_by(id: params[:album_id])
    @photo = @album.photos.build(photo_params)
    if @photo.save
      redirect_to album_photo_path(current_album, @photo)
    else
      render :new
    end
  end

  def show
    @photo = Photo.find_by(id: params[:id])
    @album = @photo.album
  end

  def edit
    @photo = Photo.find_by(id: params[:id])
    @album = @photo.album
  end

  def update
    @photo = Photo.find_by(id: params[:id])
    @album = @photo.album
    @photo.update(photo_params)
    if @photo.valid?
      redirect_to album_photo_path(@photo, current_album)
    else
      render :edit
    end
  end

  def destroy
    @photo = Photo.find_by(id: params[:id])
    @album = @photo.album
    @photo.destroy
    redirect_to album_path(@album)
  end

  private

  def current_album
    Album.find_by(id: params[:album_id])
  end

  def photo_params
    params.require(:photo).permit(:title, :description, :date, :location, :album_id)
  end
end
