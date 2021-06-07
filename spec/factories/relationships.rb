FactoryBot.define do
  factory :relationship do
    user { FactoryBot.create(:user) }
    cat { FactoryBot.create(:cat) }
  end
end
