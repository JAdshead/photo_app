  class AlbumsController < ApplicationController

  before_filter :authenticate_user!, except: [:show, :index]
  load_and_authorize_resource


  def index
    @albums = Album.all

  end

  def show
    @photo = Photo.new
    @album = Album.find params[:id]
    @photos = @album.photos.plusminus_tally.order('plusminus_tally DESC').all
  end

  def new
    @album = Album.new
    @album.user = current_user
  end

  def create
    @album = Album.new params[:album]
    @album.user_id = current_user.id
    if @album.save
      redirect_to @album
    else
      render action: "new"
    end
  end

  def edit
    @album = Album.find params[:id]
  end

  def update
    @album = Album.find params[:id]
    if @album.update_attributes params[:album]
      redirect_to @album
    else
      render action: "edit"
    end
  end

  def destroy
    album = Album.find params[:id]
    user = User.find(album.user_id)
    album.delete
    redirect_to user
  end

end
