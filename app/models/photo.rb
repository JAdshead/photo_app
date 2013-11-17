class Photo < ActiveRecord::Base
  attr_accessible :title, :description, :image
  mount_uploader :image, ImageUploader

  belongs_to :user
  belongs_to :album
  has_many :comments

end
