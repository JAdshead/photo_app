class Authorization < ActiveRecord::Base

attr_accessible :provider, :uid

belongs_to :user

end

#   after_create :fetch_details

#   attr_accessor :temp_auth_hash

#   def fetch_details
#     self.send("fetch_details_from_#{self.provider.downcase}")
#   end


#   def fetch_details_from_facebook
#     graph = Koala::Facebook::API.new(self.token)
#     facebook_data = graph.get_object("me")
#     self.username = facebook_data['username']
#     self.save
#     self.user.name = facebook_data['username'] if self.user.name.blank?
#     # self.user.remote_image_url = "http://graph.facebook.com/" + self.username + "/picture?type=large" if self.user.image.blank?
#     # self.user.location = facebook_data['location'] if self.user.location.blank?
#     self.user.save
#   end

#   def fetch_details_from_google_oauth2
#     google_oauth2_data = temp_auth_hash
#     self.username = google_oauth2_data['name']
#     self.save
#     self.user.name = google_oauth2_data['username'] if self.user.name.blank?
#     # self.user.remote_image_url = "https://plus.google.com/" + self.username + "/photo.jpg" if self.user.image.blank?
#     # self.user.location = "" if self.user.location.blank?
#     self.user.save
#   end


# facebook auth hash

# {
#   :provider => 'facebook',
#   :uid => '1234567',
#   :info => {
#     :nickname => 'jbloggs',
#     :email => 'joe@bloggs.com',
#     :name => 'Joe Bloggs',
#     :first_name => 'Joe',
#     :last_name => 'Bloggs',
#     :image => 'http://graph.facebook.com/1234567/picture?type=square',
#     :urls => { :Facebook => 'http://www.facebook.com/jbloggs' },
#     :location => 'Palo Alto, California',
#     :verified => true
#   },
#   :credentials => {
#     :token => 'ABCDEF...', # OAuth 2.0 access_token, which you may wish to store
#     :expires_at => 1321747205, # when the access token expires (it always will)
#     :expires => true # this will always be true
#   },
#   :extra => {
#     :raw_info => {
#       :id => '1234567',
#       :name => 'Joe Bloggs',
#       :first_name => 'Joe',
#       :last_name => 'Bloggs',
#       :link => 'http://www.facebook.com/jbloggs',
#       :username => 'jbloggs',
#       :location => { :id => '123456789', :name => 'Palo Alto, California' },
#       :gender => 'male',
#       :email => 'joe@bloggs.com',
#       :timezone => -8,
#       :locale => 'en_US',
#       :verified => true,
#       :updated_time => '2011-11-11T06:21:03+0000'
#     }
#   }
# }

# info available in google_oauth2 user hash

# request.env["omniauth.auth"]:

# {
#     :provider => "google_oauth2",
#     :uid => "123456789",
#     :info => {
#         :name => "John Doe",
#         :email => "john@company_name.com",
#         :first_name => "John",
#         :last_name => "Doe",
#         :image => "https://lh3.googleusercontent.com/url/photo.jpg"
#     },
#     :credentials => {
#         :token => "token",
#         :refresh_token => "another_token",
#         :expires_at => 1354920555,
#         :expires => true
#     },
#     :extra => {
#         :raw_info => {
#             :id => "123456789",
#             :email => "user@domain.example.com",
#             :verified_email => true,
#             :name => "John Doe",
#             :given_name => "John",
#             :family_name => "Doe",
#             :link => "https://plus.google.com/123456789",
#             :picture => "https://lh3.googleusercontent.com/url/photo.jpg",
#             :gender => "male",
#             :birthday => "0000-06-25",
#             :locale => "en",
#             :hd => "company_name.com"
#         }
#     }
# }
