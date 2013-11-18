class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.role? :admin
      can :manage, :all
    elsif user.role? :user
      can :read, :all
      can :manage, Album do |album|
          album.user == user
        end
    else
      can :read, :all
      can :create, User
    end
  end
end
