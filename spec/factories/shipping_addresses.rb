FactoryBot.define do
  factory :shipping_address do
    product_id { 1 }
    user_id { 1 }
    post_code { '123-4567' }
    prefecture_id { 1 }
    city { '横浜市'}
    house_number { '旭区１２３' }
    building_name { 'ビル' }
    phone_number { '12345678901'}
    token { "tok_abcdefghijk00000000000000000" }
  end
end
