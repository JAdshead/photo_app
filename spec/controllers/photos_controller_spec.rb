require "spec_helper"
include ActionDispatch::TestProcess

describe PhotosController do

  before :each do
    @user = FactoryGirl.create :user
    @user.confirm!
    sign_in @user
    @photo = Photo.create!(title: "title", description: "description", image: fixture_file_upload('/images/placeholder.jpg', 'image/jpg'))
  end

  describe "POST vote_up" do

    # test result of (photo.votes_for - photo.votes_against)
    it "should increase vote by one" do
      post :vote_up, id: @photo.id
      (@photo.votes_for - @photo.votes_against).should == 1
    end
  end

  describe "POST vote_down" do

    # test result of (photo.votes_for - photo.votes_against)
    it "should increase vote by one" do
      post :vote_down, id: @photo.id
      (@photo.votes_for - @photo.votes_against).should == (-1)
    end
  end

end
