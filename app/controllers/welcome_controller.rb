class WelcomeController < ApplicationController

  layout "home"

  def index
    page = params[:page] || 1
    per_page = 9
    @photos = Photo.plusminus_tally.order('plusminus_tally DESC').paginate(page: page, per_page: per_page)
  end

end

