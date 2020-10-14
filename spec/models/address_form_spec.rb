require 'rails_helper'

RSpec.describe AddressForm, type: :model do
  before do
    @address_form = FactoryBot.build(:address_form)
  end

  describe '商品の購入' do
    context '商品が購入できる場合' do
    
      it 'すべての値が正しく入力されていれば購入できること' do
        expect(@address_form).to be_valid
      end
      it 'building_nameが空でも購入できること' do
        @address_form.building_name = nil
        expect(@address_form).to be_valid
      end
    end

    context '商品が購入できない場合' do
      it 'tokenが空では保存ができないこと' do
        @address_form.token = nil
        @address_form.valid?
        expect(@address_form.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと購入できないこと' do
        @address_form.postal_code = nil
        @address_form.valid?
        expect(@address_form.errors.full_messages).to include( "Postal code is invalid. Include hyphen(-)")
      end
      it 'region_idが空だと購入できないこと' do
        @address_form.region_id = 0
        @address_form.valid?
        expect(@address_form.errors.full_messages).to include("Region must be other than 0")
      end
      it 'municipalitiesが空だと購入できないこと' do
        @address_form.municipalities = nil
        @address_form.valid?
        expect(@address_form.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'house_numberが空だと購入できないこと' do
        @address_form.house_number = nil
        @address_form.valid?
        expect(@address_form.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空だと購入できないこと' do
        @address_form.phone_number = nil
        @address_form.valid?
        expect(@address_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'potal_codeにハイフンがないと購入できないこと' do
        @address_form.postal_code = '1234567'
        @address_form.valid?
        expect(@address_form.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'phone_numberにハイフンがあると購入できないこと' do
        @address_form.phone_number = '090-1234-5678'
        @address_form.valid?
        expect(@address_form.errors.full_messages).to include('Phone number is invalid.')
      end
      it 'phone_numberが11桁より大きいと購入できないこと' do
        @address_form.phone_number = '090123456789'
        @address_form.valid?
        expect(@address_form.errors.full_messages).to include('Phone number is invalid.')
      end
    end
  end
end
