FactoryBot.define do
  factory :item do
    association :user
    association :category
    association :sales_status
    association :shipping_fee_status
    association :prefecture
    association :scheduled_delivery

    name { 'りんご' }
    detail { 'おいしいです' }
    item_price { 3000 }

    after(:build) do |i|
      i.image.attach(io: File.open('public/images/test_image.JPEG'), filename: 'test_image.JPEG')
    end
  end
end
