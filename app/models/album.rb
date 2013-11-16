class Album < ActiveRecord::Base
   attr_accessible :title, :description, :user_id

   belongs_to :user
   has_many :photos

end
