FactoryBot.define do
  factory :user do
    nickname { 'suzutaro' }
    email { Faker::Internet.free_email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    name_first { '鈴木' }
    name_last { '太郎' }
    name_reading_first { 'スズキ' }
    name_reading_last { 'タロウ' }
    birthday { '1995-12-23' }
  end
end
