class PhotosController < ApplicationController

before_filter :authenticate_user!, except: [:show, :index]
load_and_authorize_resource

  def index
  end

  def show
    @comment = Comment.new
  end

  def new
  end

  def create
    @photo.album_id = params[:album_id]
    if @photo.save
      redirect_to @photo.album
    else
      @album = Album.find params[:album_id]
      @photos = @album.photos.plusminus_tally.order('plusminus_tally DESC').all
      render  :template => "albums/show"
    end
  end

  def edit
  end

  def update
    @photo = Photo.find params[:id]
    if @photo.update_attributes params[:photo]
      updated_message = "Photo updated succesfully!"
      redirect_to @photo, notice: updated_message
    else
      render action: "edit"
    end
  end

  def destroy
    photo = Photo.find params[:id]
    photo.delete
    destroyed_message = "Photo removed succesfully!"
    redirect_to photo.album, notice: destroyed_message
  end

  def vote_up
    @photo = Photo.find params[:id]
    current_user.vote_for(@photo)
    redirect_to @photo
  end

  def vote_down
    @photo = Photo.find params[:id]
    current_user.vote_against(@photo)
    redirect_to @photo
  end

end
