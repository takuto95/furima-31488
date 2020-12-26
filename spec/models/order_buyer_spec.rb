require 'rails_helper'

RSpec.describe OrderBuyer, type: :model do
  before do
    @order_buyer = FactoryBot.build(:order_buyer)
  end

  it 'すべての値が正しく入力されていれば保存ができること' do
    expect(@order_buyer).to be_valid
  end

  it 'postal_codeが空では保存ができないこと' do
    @order_buyer.postal_code = nil
    @order_buyer.valid?
    expect(@order_buyer.errors.full_messages).to include("Postal code can't be blank")
  end

  it 'prefectureが1では保存できないこと' do
    @order_buyer.prefecture_id = 1
    @order_buyer.valid?
    expect(@order_buyer.errors.full_messages).to include('Prefecture must be other than 1')
  end

  it 'cityが空では保存ができないこと' do
    @order_buyer.city = nil
    @order_buyer.valid?
    expect(@order_buyer.errors.full_messages).to include("City can't be blank")
  end

  it 'house_numberが空では保存ができないこと' do
    @order_buyer.house_number = nil
    @order_buyer.valid?
    expect(@order_buyer.errors.full_messages).to include("House number can't be blank")
  end

  it 'building_nameが空でも保存ができること' do
    @order_buyer.building_name = nil
    expect(@order_buyer).to be_valid
  end

  it 'phone_numberが空では保存ができないこと' do
    @order_buyer.phone_number = nil
    @order_buyer.valid?
    expect(@order_buyer.errors.full_messages).to include("Phone number can't be blank")
  end

  it 'phone_numberが12桁以上だと保存できないこと' do
    @order_buyer.phone_number = "111111111111111"
    @order_buyer.valid?
    expect(@order_buyer.errors.full_messages).to include("Phone number is invalid")
  end

  it 'tokenが空では登録ができないこと' do
    @order_buyer.token = nil
    @order_buyer.valid?
    expect(@order_buyer.errors.full_messages).to include("Token can't be blank")
  end
end
