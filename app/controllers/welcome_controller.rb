class WelcomeController < ApplicationController

  def index
    page = params[:page] || 1
    per_page = 6
    @photos = Photo.paginate(page: page, per_page: per_page).plusminus_tally.order('plusminus_tally DESC')
  end

end

