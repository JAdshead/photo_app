include ActionDispatch::TestProcess

FactoryGirl.define do

  factory :user do
    trait :with_albums do
      ignore do
        album_count 1 # tells FG this is NOT an attribute
      end

      after(:create) do |user, evaluator|
        FactoryGirl.create_list :album_with_photos_with_comments, evaluator.album_count, user: user
      end
    end

    # trait :with_albums_with_photos_with_comments do
    #   ignore do
    #     album_count 3 # tells FG this is NOT an attribute
    #     photo_count 3 # tells FG this is NOT an attribute
    #     comment_count 3 # tells FG this is NOT an attribute
    #   end

    #   after(:create) do |user, evaluator|
    #     FactoryGirl.create_list :albums_with_photos_with_comments, evaluator.album_count, evaluator.photo_count, evaluator.comment_count, user: user
    #   end
    # end

    sequence(:name) { |n| "user-#{n}" } #sequence
    email { "#{name}@gmail.com" }       #dependent attribute
    password "password"
    role "user"

    factory :user_with_albums, traits: [:with_albums]

    factory :admin do
      role "admin"
      factory :admin_with_albums, traits: [:with_albums]
    end
  end
end
