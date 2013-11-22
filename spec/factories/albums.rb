include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :album do
    title { Faker::Name.first_name }
    description { Faker::Lorem.sentence}

    # associations
    user

    trait :with_photos_with_comments do
      ignore do
        photo_count 1 # tells FG this is NOT an attribute
      end

      after(:create) do |album, evaluator|
        FactoryGirl.create_list :photo_with_comments, evaluator.photo_count, album: album, user: album.user
      end
    end

    factory :album_with_photos_with_comments, traits: [:with_photos_with_comments]
  end
end
