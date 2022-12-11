FactoryBot.define do
  factory :housework do
    housework_name {Faker::Name.name}
    housework_type {'test'}
    buy_date {2022/12/01}
    parts_name {'test'}
    parts_type {'test'}
    exchange {'6ヶ月'}

    after(:build) do |housework|
      housework.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end