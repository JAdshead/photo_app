class UsersController < Devise::RegistrationsController

  load_and_authorize_resource

  def index
    @users = User.all
  end

  def show
    @user = User.find params[:id]
  end

  def create
    super
    @user.role = 'user'
    @user.save!
  end

  

end
