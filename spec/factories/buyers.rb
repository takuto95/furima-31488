FactoryBot.define do
  factory :buyer do
    association :item
    association :user
  end
end
