require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  describe '商品の購入' do
    context '商品が購入できる場合' do
      it 'すべての値が正しく入力されていれば購入できること' do
        expect(@order).to be_valid
      end
      it 'building_nameが空でも購入できること' do
        @order.building_name = nil
        expect(@order).to be_valid
      end
    end

    context '商品が購入できない場合' do
      it 'tokenが空では保存ができないこと' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと購入できないこと' do
        @order.postal_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("postal_code can't be blank")
      end
      it 'region_idが空だと購入できないこと' do
        @order.region_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Region can't be blank")
      end
      it 'municipalitiesが空だと購入できないこと' do
        @order.municipalities = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'addressが空だと購入できないこと' do
        @order.address = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと購入できないこと' do
        @order.phone_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'potal_codeにハイフンがないと購入できないこと' do
        @order.postal_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'phone_numberにハイフンがあると購入できないこと' do
        @order.phone_number = '090-1234-5678'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is invalid.')
      end
      it 'phone_numberが11桁より大きいと購入できないこと' do
        @order.phone_number = '090123456789'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is invalid.')
      end
    end
  end
end
