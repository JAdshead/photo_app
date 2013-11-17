class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # , :lockable, and :omniauthable
  devise  :database_authenticatable,
          :registerable,
          :recoverable,
          :rememberable,
          :trackable,
          :validatable,
          :confirmable,
          :timeoutable,
          { :confirm_within => 10.minutes }

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :name, :email, :image, :password, :role

  has_many :albums
  has_many :comments
  has_many :photos, through: :album
end
