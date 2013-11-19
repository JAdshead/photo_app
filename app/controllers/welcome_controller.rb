class WelcomeController < ApplicationController

  def index
    @photos = Photo.plusminus_tally.order('plusminus_tally DESC').all
  end

# Just testing

end
