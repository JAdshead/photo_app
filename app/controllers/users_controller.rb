class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find params[:id]
  end

  def new
    @user = User.new
  end

  def create
    # need this to be an instance variable for devise - have not changed
    user = User.create params[:user]
    user.role = "user"
    user.save!
    redirect_to user
  end

  def edit
    @user = User.find params[:id]
    logger.info self.class.ancestors
    super
  end

  def update
    user = User.find params[:id]
    user.update_attributes params[:user]
    redirect_to user
  end

  def destroy
    user = User.find params[:id]
    user.delete
    redirect_to users_path
  end

end
