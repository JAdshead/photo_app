require "spec_helper"

describe User do
  describe "validations" do
    it{ should validate_presence_of :name }
    it{ should validaste_uniqueness_of :name }
    it{ should validate_presence_of :image }
  end

  describe "mass assignment" do
    it { should allow_mass_assignment_of :name}
    it { should allow_mass_assignment_of :image}

    # syntax for should_not
    # it { should_not allow_mass_assignment of :attribute }
  end

  context "when is an user with albums" do
    let!(:user){ FactoryGirl.create :user_with_albums, album_count: 3 }
    it "has the correct album count" do
      user.albums.count.should == 3
    end
  end

end
