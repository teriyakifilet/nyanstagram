FactoryBot.define do
  factory :photo do
    detail { Faker::Lorem.sentence }

    association :user

    after(:build) do |photo|
      photo.cat_photo.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
