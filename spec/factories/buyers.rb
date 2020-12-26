FactoryBot.define do
  factory :buyer do
    association :item
    association :order
    association :user
  end
end
