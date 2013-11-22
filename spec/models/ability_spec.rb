require "spec_helper"
require "cancan/matchers"


# pseudo code:

# factory girl create user-1, user-2, user-3
# factory girl create album-1, album-2, album-3
# factory girl create photo-1, photo-2, photo-3
# user-1 has album-1 with photo-1 inside it
# user-2 has album-2 with photo-2 inside it
# user-3 has album-3 with photo-3 inside it
# user-3 is an admin

# user-1, user-2 and user-3 should be able to read all

# user-1 should be able to create, update and destroy albums belonging to them
# user-1 should be able to create, update and destroy photos within albums belonging to them
# user-1 should not be to create, update or destroy albums belonging to user-2 (i.e. album-2)
# user-1 should not be able to create, update or destroy photos within albums belonging to user-2 (i.e. photo-2)

# user-3 should be able to create, update and destroy albums belonging to user-1
# user-3 should be able to create update and destroy photos belonging to user-2

# user-1 should be able to update and destroy their own profile
# user-1 should not be able to update or destroy user-2's profile
# user-3 should be able to update and destroy user-2's profile

# user1, user-2 and user-3 should be able to comment on photo-3, photo-1 and photo-2 respectively
# user-1, user-2 and user-3 should be able to vote up on photo-3, photo-1 and photo-2 respectively
# user-1, user-2 and user-3 should be able to vote down on photo-3, photo-1 and photo-2 respectively
# user-1 should not be able to vote up on photo-1
# user-1 should not be able to vote down on photo-1


describe "User" do

  before :each do
  @user-1 = FactoryGirl.create :user_with_albums
  @user.confirm!
  @user-2 = FactoryGirl.create :user_with_albums
  @user-2.confirm!
  @user-3 = FactoryGirl.create :admin_with_albums
  @user-3.confirm!
  end

  # describe "admin" do
  #   subject(:ability){ Ability.new(:user) }
  #   # let(:user){ nil }

  #   # context "when is an user" do
  #   #   let(:user){ Factory(:user) }
  #   #   it{ should be_able_to(:manage, Album.new) }
  #   # end

  #   context "when is an admin" do

  #     let(:admin){ FactoryGirl.create(:admin) }
  #     # @user.role = "admin"
  #     it { should be_able_to(:manage, :all) }
    end

  end
end


