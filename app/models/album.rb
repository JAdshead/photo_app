class Album < ActiveRecord::Base
  attr_accessible :title, :description

  belongs_to :user
  has_many :photos

  validates :title, :description, presence: true

  ###########################
  ##### * NICE TO HAVE * ####
  # OWN VALIDATION MESSAGES #
  ########## LOGIC ##########
  ###########################

  # validate  :form_validator

  # def form_validator
    # unless self.title.present?
      # errors.add(:title, "Album must have a title")
    # end
    # unless self.description.present?
      # errors.add(:description, "Album must have a description")
    # end
  # end

end
