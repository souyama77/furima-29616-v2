require 'rails_helper'

RSpec.describe PayForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order = FactoryBot.build(:pay_form, user_id: user.id, item_id: item.id)
    sleep 1
  end

  context "商品購入がうまくいく時" do
    it "全ての値が存在する時商品購入ができる" do
 
      expect(@order).to be_valid
    end
    it "building_nameが空でも商品購入ができる" do
      @order.building_name = nil
      expect(@order).to be_valid
    end
  end
  context "商品購入ができない時" do
    it "postal_numberが空の時" do
      @order.postal_code = nil
      @order.valid?
      expect(@order.errors.full_messages).to include ("Postal code can't be blank")
    end
    it "postal_codeにハイフンが無い時" do
      @order.postal_code = "1234567"
      @order.valid?
      expect(@order.errors.full_messages).to include ("Postal code is invalid")
    end
    it "postal_codeのハイフンの前に３文字の整数が無い時" do
      @order.postal_code = "-1234"
      @order.valid?
      expect(@order.errors.full_messages).to include ("Postal code is invalid")
    end
    it "postal_codeのハイフン後は４文字の整数が無い時" do
      @order.postal_code = "123-"
      @order.valid?
      expect(@order.errors.full_messages).to include ("Postal code is invalid")
    end
    it "postal_codeに文字が含まれている時" do
      @order.postal_code = "a123456"
      @order.valid?
      expect(@order.errors.full_messages).to include ("Postal code is invalid")
    end
    it "postal_codeに全角の数字である時" do
      @order.postal_code = "１２３４５６７"
      @order.valid?
      expect(@order.errors.full_messages).to include ("Postal code is invalid")
    end
    it "prefecture_code_idが空の時" do
      @order.prefecture_code_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include ("Prefecture code can't be blank")
    end
    it "prefecture_code_idが0の時" do
      @order.prefecture_code_id = 0
      @order.valid?
      expect(@order.errors.full_messages).to include ("Prefecture code must be other than 0")
    end
    it "cityが空の時" do
      @order.city = nil
      @order.valid?
      expect(@order.errors.full_messages).to include ("City can't be blank")
    end
    it "house_numberが空の時" do
      @order.house_number = nil
      @order.valid?
      expect(@order.errors.full_messages).to include ("House number can't be blank")
    end
    it "phone_numberが空の時" do
      @order.phone_number = nil
      @order.valid?
      expect(@order.errors.full_messages).to include ("Phone number can't be blank")
    end
    it "phone_numberが１２桁以上存在する時" do
      @order.phone_number = "1234567890123"
      @order.valid?
      expect(@order.errors.full_messages).to include ("Phone number is invalid")
    end
    it "phone_numberが9桁以下の時" do
      @order.phone_number = "123456789"
      @order.valid?
      expect(@order.errors.full_messages).to include ("Phone number is invalid")
    end
    it "phone_numberに文字が含まれる時" do
      @order.phone_number = "a123456789b"
      @order.valid?
      expect(@order.errors.full_messages).to include ("Phone number is invalid")
    end
    it "phone_numberの全角数字がある時" do
      @order.phone_number = "１２３４５６７８９０１"
      @order.valid?
      expect(@order.errors.full_messages).to include ("Phone number is invalid")
    end
    it "phone_numberにハイフンが含まれている時" do
      @order.phone_number = "123-4567-8901"
      @order.valid?
      expect(@order.errors.full_messages).to include ("Phone number is invalid")
    end
    it "tokenが空の時" do
      @order.token = nil
      @order.valid?
      expect(@order.errors.full_messages).to include ("Token can't be blank")
    end
    it "user_idが空の時" do
      @order.user_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include ("User can't be blank")
    end
    it "item_idが空の時" do
      @order.item_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Item can't be blank")
    end
  end
end
