require "spec_helper"

describe "views/devise/new.html.erb" do

  it "should render a link to create a new user" do
    rendered.should have_link("Resend confirmation instructions")
  end


end
