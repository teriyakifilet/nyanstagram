FactoryBot.define do
  factory :user do
    email            { Faker::Internet.email }
    password         { 'pass123' }
    password_confirmation { password }
    user_name        { Faker::Name.name }
    user_profile     { Faker::Lorem.sentence }
  end
end