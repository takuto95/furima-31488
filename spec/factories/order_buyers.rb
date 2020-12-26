FactoryBot.define do
  factory :order_buyer do
    user_id { 1 }
    item_id { 1 }
    prefecture_id { 2 }
    postal_code { '123-4567' }
    city { '横浜市' }
    house_number { '青山' }
    building_name { '１丁目' }
    phone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
