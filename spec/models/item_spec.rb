require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品成功時' do
    before do
      @item = FactoryBot.build(:item)
    end
    context "商品出品登録がうまくいく時" do
      it "全てが存在する時、商品出品が出来る" do
        expect(@item).to be_valid
      end
    end
    context "商品出品が出来ない時" do
      it "imageが空の時" do
        @item.image = nil
        @item.valid?

        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "nameが空の時" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "explanationが空の時" do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it "category_idが空の時" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      
      it "item_conditionが空の時" do
        @item.item_condition = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition can't be blank")
      end
      
      it "postage_payer_idが空の時" do
        @item.postage_payer_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage payer can't be blank")
      end
      
      it "prefecture_code_idが空の時" do
        @item.prefecture_code_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture code can't be blank")
      end
      
      it "preparation_day_idが空の時" do
        @item.preparation_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Preparation day can't be blank")
      end
      
      it "priceが空の時" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが299以下の時" do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it "priceが10 000 000以上の時" do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it "priceが全角の時" do
        @item.price = "１０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it "priceが半角数字以外が含まれる時" do
        @item.price = "aaaaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
    end
  end
end