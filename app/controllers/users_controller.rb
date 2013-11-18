class UsersController < Devise::RegistrationsController

  def index
    @users = User.all

  end

  def show
    @user = User.find params[:id]
    @albums = @user.albums
    @phots @album.photos.plusminus_tally.order('plusminus_tally DESC').all 
  end

  def create
    # run the default version in Devise::RegistrationsController
    super
    # then run our custom logic
    @user.role = 'user' 
    @user.save!
  end

  

end
