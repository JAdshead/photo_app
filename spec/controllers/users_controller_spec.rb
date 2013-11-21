require "spec_helper"

describe UsersController do
  describe "GET index" do
    # defining a variable for the scope of the test
    # and creating 3 instances of the object we're testing
    let!(:users) { 3.times map{|index| User.create(name: "user-#{index}", image: fixture_file_upload('/images/placeholder.jpg', 'image/jpg') } }
    # writing tests
    it "should instantiate @users with all users in the database" do
      get :index
      expect(assigns[:users]).to eq(users)
    end

    it "should render index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

end
