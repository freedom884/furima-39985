FactoryBot.define do

  factory :product do
    association :user
    
    name { Faker::Name.name }
    description { Faker::Lorem.sentence }
    category_id { 2 }
    condition_id { 2 }
    shippingfee_id { 2 }
    prefecture_id { 15 }
    scheduleddelivery_id { 1 }
    price { rand(300..9_999_999) }

    
    after(:build) do |product|
      product.image.attach(io: File.open('public/images/sample.png'), filename: 'sample.png')
      end
  end
end
