class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # , :lockable, and
  devise  :database_authenticatable,
          :registerable,
          :recoverable,
          :rememberable,
          :trackable,
          :validatable,
          :confirmable,
          :omniauthable,
          :timeoutable,
          {
            :confirm_within => 10.minutes,
            :omniauth_providers => [:google_oauth2]
          }

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :image, :role, :email, :password, :password_confirmation, :remember_me

  has_many :albums
  has_many :comments
  has_many :photos, through: :album

  acts_as_voter
  has_karma :photos, :as => :submitter, :weight => [ 1.0, -0.5 ]

  def self.from_omniauth(auth)
    if user = User.find_by_email(auth.info.email)
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.role = "user"
      user
    else
      User.where(auth.slice(:provider, :uid)).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.name = auth.info.name
        user.role = "user"
        user.password = Devise.friendly_token[0, 20]
        user.skip_confirmation!
        user
      end
    end
  end

  def role?(r)
    self.role == r.to_s
  end
end
