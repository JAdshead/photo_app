class SearchesController < ApplicationController
  def create
    query_terms = params[:query].split.join("|")
    @photos = Photo.tagged_with("#{query_terms}")
    render :index
  end
end
