class CommentsController < ApplicationController

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
    @comment = Comment.create params[:comment]
    redirect_to @comment
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
    redirect_to comments_path
  end


end


