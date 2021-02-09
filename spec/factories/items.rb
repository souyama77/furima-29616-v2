FactoryBot.define do
  factory :item do
    name               {Faker::Lorem.word}
    explanation        {Faker::Lorem.sentence}
    category_id        {Faker::Number.within(range:1..10)}
    item_condition_id  {Faker::Number.within(range:1..6)}
    postage_payer_id   {Faker::Number.within(range:1..2)}
    prefecture_code_id {Faker::Number.within(range:1..47)}
    preparation_day_id {Faker::Number.within(range:1..3)}
    price              {Faker::Number.within(range:300..9_999_999)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('spec/models/fixtures/test_image.png'), filename: 'test_image.png')
    end
  end
end
