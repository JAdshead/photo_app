class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.has_role? :admin
      can :manage, :all

    elsif user.has_role? :user
      can :read, :all
      can :vote_up, :all
      can :vote_down, :all

      can :manage, User do |user_object|
          user_object == user
      end

      can :create, Album 
      can :manage, Album do |album|
          album.user == user
      end

      can :edit, Album do |album|
          album.user == user
      end

      can :create, Photo
      can :manage, Photo do |photo|
          photo.user == user
      end


      can :update, Photo do |photo|
          photo.album.user == user
      end
      can :destroy, Photo do |photo|
          photo.album.user == user
      end

      can :create, Comment
      can :destroy, Comment do |comment|
          comment.user == user
      end

    else
      can :read, :all
      can :create, User
    end
  end
end
