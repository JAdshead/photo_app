class User < ActiveRecord::Base
  attr_accessible :name, :email, :image, :password, :role

  has_many :albums
  has_many :comments
  has_many :photos, through: :album
end
