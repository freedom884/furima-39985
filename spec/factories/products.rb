FactoryBot.define do
  factory :product do
    name { "Example Product" }
    description { "This is a sample product." }
    category
    condition
    shippingfee
    prefecture
    scheduleddelivery
    user
    price { 1000 }




    
  end
end
