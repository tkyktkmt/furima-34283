FactoryBot.define do
  factory :item do
    product_name  {Faker::Commerce.product_name}       
    detail        {Faker::Lorem.sentence}               
    price         {Faker::Commerce.price(range: 300..9999999)}
    category_id   {Faker::Number.within(range: 2..11)}          
    status_id     {Faker::Number.within(range: 2..7)}          
    shipping_fee_burden_id {Faker::Number.within(range: 2..3)}       
    shipping_date_id {Faker::Number.within(range: 2..4)}     
    province_id {Faker::Number.within(range: 1..47)}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')            
    end 
  end
end
