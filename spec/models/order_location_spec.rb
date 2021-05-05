require 'rails_helper'

RSpec.describe OrderLocation, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order_location = FactoryBot.build(:order_location, user_id: @user.id, item_id: @item.id)
      sleep 0.1
    end
    context '商品が購入できる時' do
      it 'ログイン状態の出品者以外のユーザーのみ、必要な情報を適切に入力すると、商品の購入ができること' do
        expect(@order_location).to be_valid
      end
    end
    context '商品が購入できない時' do
      it '未ログイン状態では購入できないこと' do
        @order_location.user_id = nil
        @order_location.valid?
        expect(@order_location.errors.full_messages).to include("User can't be blank")
      end
      
      it 'postal_codeが空では購入できないこと' do
        @order_location.postal_code = nil
        @order_location.valid?
        expect(@order_location.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid. Include hyphen(-)")
      end
      
      it 'province_idが空では購入できないこと' do
        @order_location.province_id = nil
        @order_location.valid?
        expect(@order_location.errors.full_messages).to include("Province can't be blank")
      end
      
      it 'cityが空では購入できないこと' do
        @order_location.city = nil
        @order_location.valid?
        expect(@order_location.errors.full_messages).to include("City can't be blank")
      end
      
      it 'address_line1が空では購入できないこと' do
        @order_location.address_line1 = nil
        @order_location.valid?
        expect(@order_location.errors.full_messages).to include("Address line1 can't be blank")
      end
      
      it 'phone_numberが空では購入できないこと' do
        @order_location.phone_number = nil
        @order_location.valid?
        expect(@order_location.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'postal_codeにハイフンがなければ購入できないこと' do
        @order_location.postal_code = "1234567"
        @order_location.valid?
        expect(@order_location.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it 'phone_numberが11桁以上の場合は購入できないこと' do
        @order_location.phone_number = 123456789012
        @order_location.valid?
        expect(@order_location.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberに数字以外が混在すると購入できないこと' do
        @order_location.phone_number = "12345680a2"
        @order_location.valid?
        expect(@order_location.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end