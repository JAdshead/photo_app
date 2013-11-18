class Comment < ActiveRecord::Base

  attr_accessible :description, :photo_id

  belongs_to :user
  belongs_to :photo
end
