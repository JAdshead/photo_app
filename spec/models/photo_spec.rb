require "spec_helper"

describe Photo do
  describe "validations" do
    it{ should validate_presence_of :title }
    it{ should validate_presence_of :description}
  end


  describe "mass assignment" do
    it{ should allow_mass_assignment_of :title}
    it{ should allow_mass_assignment_of :description}
  end

  context "when is a photo with comments" do
    let!(:photo){ FactoryGirl.create :photo_with_comments, comment_count: 3 }
    it "has the correct comment count" do
      photos.comments.count.should == 3
    end
  end

end
