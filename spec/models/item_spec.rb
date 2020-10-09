require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '商品の出品' do
      context '商品が出品できる場合' do
        it 'image/product_name/product_description/category_id/state_id/region_id/region_id/shipping_time_id/priceがあれば保存できる' do
          expect(@item).to be_valid
        end
      end

      context '商品が出品できない場合' do
        it 'imageがなければ出品できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it 'product_nameがなければ出品できない' do
          @item.product_name = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Product name can't be blank")
        end
        it 'product_descriptionがなければ出品できない' do
          @item.product_description = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Product description can't be blank")
        end
        it 'category_idがなければ出品できない' do
          @item.category_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank", 'Category is not a number')
        end
        it 'state_idがなければ出品できない' do
          @item.state_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("State can't be blank")
        end
        it 'region_idがなければ出品できない' do
          @item.region_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Region can't be blank")
        end
        it 'region_idがなければ出品できない' do
          @item.postage_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Postage can't be blank")
        end
        it 'shipping_time_idがなければ出品できない' do
          @item.shipping_time_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping time is not a number", "Shipping time can't be blank")
        end
        it 'priceがなければ出品できない' do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it 'ユーザーが紐づいていないと出品できない' do
          @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('User must exist')
        end

        it 'priceが300~9999999以外だと出品できない' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
        end
        it 'priceが9999999より大きいと出品できない' do
          @item.price = 10_000_000
          @item.valid?
          expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
        end
      end
    end
  end

end
