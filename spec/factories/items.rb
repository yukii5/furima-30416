FactoryBot.define do
  factory :item do
      image { 'test_image.png' }
      product_name { 'リンゴ' }
      product_description { '美味しい青森県産りんごです。' }
      category_id { 3 }
      state_id { 3 }
      region_id { 3 }
      postage_id { 3 }
      shipping_time_id { 3 }
      price { 1000 }
      association :user
  
      after(:build) do |item|
        item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
      end
  
    
  end
end
