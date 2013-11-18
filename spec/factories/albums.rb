FactoryGirl.define do
  factory :album do
    title { Faker::Name.first_name }
    description { Faker::Lorem.sentence}

    # associations
    user

    trait :with_photos do
      ignore do
        photo_count 5 # tells FG this is NOT an attribute
      end

      after(:create) do |album, evaluator|
        FactoryGirl.create_list :photo, evaluator.photo_count, album: album
      end
    end

    factory :album_with_photos, traits: [:with_photos]
  end
end
