FactoryBot.define do
  factory :pay_form do
    postal_code {'123-1234'}
    prefecture_code_id {Faker::Number.within(range:1..47)}
    city {'東京都'}
    house_number {'１０丁目１１番地'}
    building_name {'ビル'}
    phone_number {'09012345678'}
    token {'tok_abcdefghijk00000000000000000'}
    user_id {1}
    item_id {1}
  end
end 
