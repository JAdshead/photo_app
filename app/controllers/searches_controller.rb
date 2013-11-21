class SearchesController < ApplicationController
  def create
    query_terms = params[:query].split
    @photos = Photo.tagged_with(query_terms, :any => true)
    if @photos == []
      @error_message = "Sorry, looks like there's no photos with those tags."
      render :index
    else
      render :index
    end
  end
end



# def create
#     query_terms = params[:query].split.join("|")
#     @photos = Photo.tagged_with("#{query_terms}")
#     render :index
#   end
