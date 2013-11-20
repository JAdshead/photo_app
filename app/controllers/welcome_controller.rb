class WelcomeController < ApplicationController

  layout "home"

  def index
    page = params[:page] || 1
    per_page = 6
    @photos = Photo.plusminus_tally.order('plusminus_tally DESC').page(params[:page])
  end

end

