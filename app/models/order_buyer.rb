class OrderBuyer
  include ActiveModel::Model
  attr_accessor :postal_code,:prefecture_id,:city,:house_number,:building_name,:phone_number,:token,:user_id,:item_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message:"is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :house_number
    validates :phone_number, format: {with: /\A\d{11}\z/, messages:"is invalid."}
    validates :token
  end

  def save
    buyer = Buyer.create(item_id: item_id, user_id: user_id)
    Order.create(postal_code: postal_code,prefecture_id: prefecture_id,city: city,house_number: house_number,building_name: building_name,phone_number: phone_number,buyer_id: buyer.id)
  end

end