require 'rails_helper'

RSpec.describe OrderLocation, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order_location = FactoryBot.build(:order_location, user_id: @user.id, item_id: @item.id)
    end
    context '商品が購入できる時' do
      it 'ログイン状態の出品者以外のユーザーのみ、必要な情報を適切に入力すると、商品の購入ができること' do
        binding.pry
        expect(@order_location).to be_valid
      end
    end
    
    context '商品が購入できない時' do
      it '未ログイン状態では購入できないこと' do

      end
      
      it '出品者は購入できないこと' do

      end
      
      it 'postal_codeが空では購入できないこと' do

      end
      
      it 'province_idが空では購入できないこと' do

      end
      
      it 'cityが空では購入できないこと' do

      end
      
      it 'address_line1が空では購入できないこと' do

      end
      
      it 'phone_numberが空では購入できないこと' do

      end

      it 'postal_codeにハイフンがなければ購入できないこと' do

      end

      it 'phone_numberが11桁以上の場合は購入できないこと' do

      end

      it 'phone_numberに数字以外が混在すると購入できないこと' do

      end

      
    end

  end
end