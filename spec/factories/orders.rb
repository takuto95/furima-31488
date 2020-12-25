FactoryBot.define do
  factory :order do
    association :buyer
    association :prefecture
  end
end
