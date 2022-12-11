FactoryBot.define do
  factory :record do
    content {Faker::Lorem.sentence}
    association :user
    association :housework
  end
end