class Order < ApplicationRecord
  attr_accessor :token
  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message:"is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :house_number
    validates :phone_number, format: {with: /\A\d{11}\z/, messages:"is invalid."}
    validates :token
  end
end
