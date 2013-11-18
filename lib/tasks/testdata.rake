require 'faker'

namespace :testdata do
  desc "Creating test data"
  task :create_tdata do
    users = FactoryGirl.create_list :user_with_albums_with_photos_with_comments, 5
  end
end
