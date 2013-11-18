# require "cancan/matchers"

# describe "User" do
#   describe "abilities" do
#     subject(:ability) { Ability.new(user) }

#     context "when is an admin" do
#       let!(:user){ FactoryGirl.create :admin }
#       it { should be_able_to(:manage, :all) }
#     end

#     context "when is an user" do
#       let!(:user){ FactoryGirl.create :user }
#       it { should be_able_to(:manage, :all) }
#     end
#   end
# end
