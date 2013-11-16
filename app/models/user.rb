class User < ActiveRecord::Base
  attr_accessible :name, :email, :image, :password, :role


end
