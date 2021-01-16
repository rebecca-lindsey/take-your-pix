class PhotosController < ApplicationController
  include PhotosHelper

  def new
    @photo = Photo.new
    @album = current_album
  end

  def create
    @album = current_album
    if current_album.photos.build(photo_params).save
      @photo = current_album.photos.last
      redirect_to photo_path(@photo)
    else
      render new_photo_path
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
    @photo.update(photo_params)
    if @photo.valid?
      redirect_to photo_path(@photo)
    else
      render edit_photo_path
    end
  end

  private

  def current_album
    Album.find_by(id: params[:id])
  end

  def photo_params
    params.require(:photo).permit(:title, :description, :date, :location, :album_id)
  end
end
