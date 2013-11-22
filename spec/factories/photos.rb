include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :photo do
    title { Faker::Name.first_name }
    description { Faker::Lorem.sentence }
    # image { fixture_file_upload('/images/placeholder.jpg', 'image/jpg') }
    # image { Rails.root.join('app/assets/images/placeholder.jpg') }
    image do
      Rack::Test::UploadedFile.new(File.open(Rails.root.join("spec/fixtures/images/placeholder.jpg")))
    end


    user
    album

    trait :with_comments do
      ignore do
        comment_count 1 # tells FG this is NOT an attribute
      end

      after(:create) do |photo, evaluator|
        FactoryGirl.create_list :comment, evaluator.comment_count, photo: photo
      end
    end

    factory :photo_with_comments, traits: [:with_comments]
  end
end
