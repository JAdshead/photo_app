require "spec_helper"

describe "users/index.html.haml" do
  let(:users) { 3.times.map{ |index| User.create name: "user #{index}", image: "image" }}

  before(:each) do
    assign :users, users
    render
    # now that render has been called, we have access to the "rendered" variable that contain the rendered html
  end

  describe "with 3 users" do
    before(:each) do
      controller.stub(:current_user).and_return( User.new )
      render
    end

    it "should have 3 rows containing albums" do
      rendered.should have_selector "ol li div.user", count: 3
    end

    it "should have a link to show the user page" do
      rendered.should have_link(users.first.name, href: user_path(users.first))
    end

    it "should render a link to create a new user" do
      rendered.should have_link("New User")
    end

  end
end
