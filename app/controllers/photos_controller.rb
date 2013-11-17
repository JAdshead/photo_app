class PhotosController < ApplicationController

  def index
    @photos = Photo.all
  end

  def show
    @photo = Photo.find params[:id]
    @comment = Comment.new
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new params[:photo]
    @photo.album_id = params[:album_id]
    @photo.save
    redirect_to @photo.album
  end

  def edit
    @photo = Photo.find params[:id]
  end

  def update
    photo = Photo.find params[:id]
    photo.update_attributes params[:photo]
    redirect_to photo
  end

  def destroy
    photo = Photo.find params[:id]
    photo.delete
    redirect_to photo.album
  end

end
