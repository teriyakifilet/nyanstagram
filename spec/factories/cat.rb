FactoryBot.define do
  factory :cat do
    cat_name        { Faker::Creature::Cat.name }
    cat_sex_id      { 2 }
    cat_breed_id    { 17 }
    cat_age         { 3 }

    association :user

    after(:build) do |cat|
      cat.icon.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end