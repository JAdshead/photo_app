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
            :omniauth_providers => [:google_oauth2, :facebook]
          }

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :avatar, :image, :role, :email, :password, :password_confirmation, :remember_me

  has_many :albums
  has_many :comments
  has_many :photos, through: :album
  has_many :providers

  acts_as_voter
  has_karma :photos, :as => :submitter, :weight => [ 1.0, -0.5 ]
  mount_uploader :avatar, ImageUploader

  # def self.from_omniauth(auth, current_user)
  #   authorization = Authorization.where(:provider => auth.provider, :uid => auth.uid.to_s, :token => auth.credentials.token, :secret => auth.credentials.secret).first_or_initialize
  #   authorization.temp_auth_hash = auth
  #   if authorization.user.blank?
  #     user = current_user.nil? ? User.where('email = ?', auth["info"]["email"]).first : current_user
  #     if user.blank?
  #       user = User.new
  #       user.password = Devise.friendly_token[0,10]
  #       user.name = auth.info.name
  #       user.email = auth.info.email
  #       user.skip_confirmation!
  #       # auth.provider == "twitter" ?  user.save(:validate => false) :  user.save
  #     end
  #     authorization.username = auth.info.nickname
  #     authorization.user_id = user.id
  #     authorization.save
  #   end
  #   authorization.user
  # end

  def role?(r)
    self.role == r.to_s
  end

  def self.from_omniauth(auth)
    if user = User.find_by_email(auth.info.email)
      profile_set(auth, user)
      user
    else
      User.where(auth.slice(:provider, :uid)).first_or_create do |user|
        profile_set(auth, user)
        user.email = auth.info.email
        user.password = Devise.friendly_token[0, 20]
        user.skip_confirmation!
        user
      end
    end
  end


  def self.profile_set(auth, user)
    user.provider = auth.provider
    user.uid = auth.uid
    user.name = auth.info.name
    user.role = "user"
    image_set(auth, user) unless user.avatar?
  end

  def self.image_set(auth, user)
    case auth.provider
    when "facebook"
      graph = Koala::Facebook::API.new(auth.credentials.token)
      profile = "http://graph.facebook.com/" + graph.get_object("me")['username'] + "/picture?type=large"
      user.remote_avatar_url = profile
    when "google_oauth2"
      user.remote_avatar_url = auth.info.image
    end
  end

end
