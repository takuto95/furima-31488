require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の登録' do
    it '入力フォームに全て入力すれば保存できる' do
      expect(@item).to be_valid
    end

    it 'imageが空では保存できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'nameが空では保存できない' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'detailが空では保存できない' do
      @item.detail = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Detail can't be blank")
    end

    it 'item_priceが空では保存できない' do
      @item.item_price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Item price can't be blank")
    end

    it 'item_priceは数字でなければ保存できない' do
      @item.item_price = 'aaaa'
      @item.valid?
      expect(@item.errors.full_messages).to include('Item price is invalid. Input half-width characters.')
    end

    it 'item_priceは299以下では保存できない' do
      @item.item_price = 100
      @item.valid?
      expect(@item.errors.full_messages).to include('Item price is out of setting range')
    end

    it 'item_priceは10_000_000以下では保存できない' do
      @item.item_price = 100_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Item price is out of setting range')
    end

    it 'category_idが1では保存できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1')
    end

    it 'sales_status_idが1では保存できない' do
      @item.sales_status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Sales status must be other than 1')
    end

    it 'shipping_fee_status_idが1では保存できない' do
      @item.shipping_fee_status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping fee status must be other than 1')
    end

    it 'prefecture_idが1では保存できない' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
    end

    it 'scheduled_delivery_idが1では保存できない' do
      @item.scheduled_delivery_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Scheduled delivery must be other than 1')
    end

    it 'userが紐づいていなければ保存できないこと' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end
  end
end
