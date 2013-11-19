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
    @photo.save
    redirect_to @photo.album
  end

  def edit
  end

  def update
    photo.update_attributes params[:photo]
    redirect_to photo
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
