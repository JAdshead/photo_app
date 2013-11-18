class Photo < ActiveRecord::Base
  attr_accessible :title, :description, :image, :tag_list
  mount_uploader :image, ImageUploader
  acts_as_taggable
  acts_as_voteable
  belongs_to :user
  belongs_to :album
  has_many :comments

end
