class Comment < ActiveRecord::Base

  attr_accessible :description, :user_id, :photo_id

  belongs_to :user
  belongs_to :photo
end
