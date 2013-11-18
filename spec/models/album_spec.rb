require "spec_helper"

describe Album do
  describe "validations" do
    it{ should validate_presence_of :title }
    it{ should validate_presence_of :description}
  end

  # uniqueness of user id

  describe "mass assignment" do
    it{ should allow_mass_assignment_of :title}
    it{ should allow_mass_assignment_of :description}
  end

  context "when is an album with photos" do
    let!(:album){ FactoryGirl.create :album_with_photos, photo_count: 3 }
    it "has the correct photo count" do
      album.photos.count.should == 3
    end
  end

end
