class CommentsController < ApplicationController

before_filter :authenticate_user!, except: [:show, :index]
load_and_authorize_resource

  def index
  end

  def show
  end

  def new
  end

  def create
    @comment.photo_id = params[:photo_id]
    @comment.user_id = current_user.id
    @comment.save
    redirect_to @comment.photo
  end

  def edit
  end

  def update
    comment.update_attributes params[:comment]
    redirect_to comment
  end

  def destroy
    comment = Comment.find params[:id]
    comment.delete
    redirect_to comment.photo
  end


end


