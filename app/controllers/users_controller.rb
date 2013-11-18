class UsersController < Devise::RegistrationsController

  def index
    @users = User.all
  end

  def show
    @user = User.find params[:id]
  end

  def create
    # run the default version in Devise::RegistrationsController
    super
    # then run our custom logic
    @user.role = 'user' 
    @user.save!
  end

  

end
