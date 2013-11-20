FactoryGirl.define do
  factory :photo do
    title { Faker::Name.first_name }
    description { Faker::Lorem.sentence }

    user
    album

    trait :with_comments do
      ignore do
        comment_count 4 # tells FG this is NOT an attribute
      end

      after(:create) do |album, evaluator|
        FactoryGirl.create_list :comment, evaluator.comment_count, photo: photo
      end
    end

    factory :photo_with_comments, traits: [:with_comments]
  end
end
