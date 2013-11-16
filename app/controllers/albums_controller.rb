class AlbumsController < ApplicationController

  def index
    @albums = Album.all
  end

  def show
    @photo = Photo.new
    @album = Album.find params[:id]
  end

  def new
    @album = Album.new
  end

  def create
    album = Album.create params[:album]
    redirect_to album
  end

  def edit
    @album = Album.find params[:id]

  end

  def update
    album = Album.find params[:id]
    album.update_attributes params[:album]
    redirect_to album
  end

  def destroy
    album = Album.find params[:id]
    album.delete
    redirect_to albums_path
  end
  
end
