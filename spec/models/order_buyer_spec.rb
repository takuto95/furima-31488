require 'rails_helper'

RSpec.describe OrderBuyer, type: :model do
  before do
    @order_buyer = FactoryBot.build(:order_buyer)
  end

  context '保存ができること' do
    it 'すべての値が正しく入力されていれば保存ができること' do
      expect(@order_buyer).to be_valid
    end

    it 'building_nameが空でも保存ができること' do
      @order_buyer.building_name = nil
      expect(@order_buyer).to be_valid
    end
  end

  context '保存ができないこと' do
    it 'postal_codeが空では保存ができないこと' do
      @order_buyer.postal_code = nil
      @order_buyer.valid?
      expect(@order_buyer.errors.full_messages).to include("Postal code can't be blank")
    end

    it 'postal_codeがハイフン無しでは保存ができないこと' do
      @order_buyer.postal_code = '12345678'
      @order_buyer.valid?
      expect(@order_buyer.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
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

    it 'phone_numberが空では保存ができないこと' do
      @order_buyer.phone_number = nil
      @order_buyer.valid?
      expect(@order_buyer.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone_numberが12桁以上だと保存できないこと' do
      @order_buyer.phone_number = '111111111111111'
      @order_buyer.valid?
      expect(@order_buyer.errors.full_messages).to include('Phone number is invalid')
    end

    it 'phone_numberが英数混合だと保存できないこと' do
      @order_buyer.phone_number = '1111ssss'
      @order_buyer.valid?
      expect(@order_buyer.errors.full_messages).to include('Phone number is invalid')
    end

    it 'tokenが空では登録ができないこと' do
      @order_buyer.token = nil
      @order_buyer.valid?
      expect(@order_buyer.errors.full_messages).to include("Token can't be blank")
    end

    it 'userが空欄であれば保存できないこと' do
      @order_buyer.user_id = nil
      @order_buyer.valid?
      expect(@order_buyer.errors.full_messages).to include("User can't be blank")
    end

    it 'itemが空欄であれば保存できないこと' do
      @order_buyer.item_id = nil
      @order_buyer.valid?
      expect(@order_buyer.errors.full_messages).to include("Item can't be blank")
    end
  end
end
