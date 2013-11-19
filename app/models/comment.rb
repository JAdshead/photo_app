class Comment < ActiveRecord::Base

  attr_accessible :description, :photo_id
  acts_as_voteable
  belongs_to :user
  belongs_to :photo

  validates :description, presence: true

end
