class CommentsController < ApplicationController

before_filter :authenticate_user!, except: [:show, :index]
load_and_authorize_resource

  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find params[:id]
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new params[:comment]
    @comment.photo_id = params[:photo_id]
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to @comment.photo
    else
      @photo = Photo.find params[:photo_id]
      render :template => "photos/show"
    end
  end

  def edit
    @comment = Comment.find params[:id]
  end

  def update
    comment = Comment.find params[:id]
    comment.update_attributes params[:comment]
    redirect_to comment
  end

  def destroy
    comment = Comment.find params[:id]
    comment.delete
    redirect_to comment.photo
  end


end


