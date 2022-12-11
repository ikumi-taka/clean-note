FactoryBot.define do
  factory :housework do
    housework_name {Faker::Name.name}
    housework_type {Faker::Internet.free_email}
    buy_date {Faker::Internet.password(min_length: 6)}
    parts_name {password}
    parts_type {}
    exchange {}

    after(:build) do |housework|
      housework.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end