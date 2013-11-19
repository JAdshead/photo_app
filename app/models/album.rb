class Album < ActiveRecord::Base
   attr_accessible :title, :description

   belongs_to :user
   has_many :photos

   validates :title, presence: true
   validate  :my_own_validator
   validates :description, presence: true
   validate :my_own_validator

  def my_own_validator
    unless self.title.present?
      errors.add(:title, "Album must have a title")
    end
    unless self.description.present?
      errors.add(:description, "Album must have a description")
    end
  end

end
