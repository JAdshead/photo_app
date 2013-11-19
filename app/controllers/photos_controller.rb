class PhotosController < ApplicationController

before_filter :authenticate_user!, except: [:show, :index]
load_and_authorize_resource

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
    if @photo.save
      redirect_to @photo.album
    else
      @album = Album.find params[:album_id]
      @photos = @album.photos.plusminus_tally.order('plusminus_tally DESC').all
      render  :template => "albums/show"
    end
  end

  def edit
    @photo = Photo.find params[:id]
  end

  def update
    @photo = Photo.find params[:id]
    if @photo.update_attributes params[:photo]
      redirect_to @photo
    else
      render action: "edit"
    end
  end

  def destroy
    photo = Photo.find params[:id]
    photo.delete
    redirect_to photo.album
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
