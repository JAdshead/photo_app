include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :comment do
    description { Faker::Lorem.sentence}

    user
    photo
  end
end
