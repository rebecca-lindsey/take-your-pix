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
      redirect_to album_photo_path(@album, @photo)
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
      redirect_to album_photo_path(@album, @photo), notice: 'Photo successfully updated!'
    else
      render :edit
    end
  end

  def destroy
    @photo = Photo.find_by(id: params[:id])
    @album = @photo.album
    @photo.destroy
    redirect_to album_path(@album), notice: 'Photo deleted!'
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :description, :date, :location, :album_id, :image)
  end
end
