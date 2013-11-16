class Photo < ActiveRecord::Base
  attr_accessible :title, :description

   belongs_to :album
   has_many :comments

end
