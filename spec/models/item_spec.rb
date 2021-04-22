require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "#create" do
    before do
      @item = FactoryBot.build(:item)
    end

    it "全ての項目に適切な値が存在すれば出品できること" do
      expect(@item).to be_valid
    end

    it "product_nameが空では出品できないこと" do
      @item.product_name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Product name can't be blank" )
    end
    
  end
end
