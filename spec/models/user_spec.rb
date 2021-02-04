require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end
    it "全て正常時登録可能" do
      expect(@user).to be_valid
    end
    it "nicknameが空のとき登録できない" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include ("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      @usser.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "emailの一意性" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "@が無いemailは登録できない" do
      @user.email = "test.test"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "passwordが空では登録できない" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordが５字以下では登録できない" do
      @user = "abc12"
      @user.valid?
      expect(@user.errors.full_messages).to include("password is invalid")
    end
    it "passwordが英語のみでは登録できない" do
      @user = "abcdef"
      @user.valid?
      expect(@user.errors.full_messages).to include("password is invalide")
    end
    it "passwordが数字のみでは登録できない" do
      @user = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("password is invalide")
    end
    it "passwordが全角では登録できない" do
      @user = "ABCDEF"
      @user.valid?
      expect(@user.errors.full_messages).to include("password is invalide")
    end
    it "passwordが半角英数字混合で無くては登録できない" do
      @user = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "passwordとpassword＿confirmationが不一致では登録できない" do
      @user.password = "abc123"
      @user.password_confirmation = "123abc"
      @user.valid?
       expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "family_nameが空では登録できない" do
      @user = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("family_name can't be blank")
    end
    it "first_nameが空では登録できない" do
      @user = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("first_name can't be blank")
    end
    it "family_nameが漢字、平仮名、カタカナ以外では登録できない" do
      @user = "Yamada"
      @user.valid?
      expect(@user.errors.full_messages).to include("family_name is invalid")
    end
    it "first_nameが漢字、平仮名、カタカナ以外では登録できない" do
      @useer = "Tarou"
      @user.valid?
      expect(@user.errors.full_messages).to include("first_name is invalide")
    end
    it "faimiy_name_kanaが空では登録できない" do
      @user = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("family_name_kana can't be blank")
    end
    it "firdt_name_kanaが空では登録できない" do
      @user = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("first_name_kana can't be blank")
    end
    it "family_name_kanaが平仮名では登録できない" do
      @user = "やまだ"
      @user.valid?
      expect(@user.errors.full_messages).to include("family_name_kana is invalid")
    end
    it "first_name_kanaが平仮名では登録できない" do
      @user = "たろう"
      @user.valid?
      expect(@user.errors.full_messages).to include("first_name_kana is invalid")
    end
    it "family_name_kanaが漢字では登録できない" do
      @user = "山田"
      @user.valid?
      expect(@user.errors.full_messages).to include("family_name_kana is invalide")
    end
    it "first_name_kanaが漢字では登録できない" do
      @user = "太郎"
      @user.valid?
      expect(@user.errors.full_messages).to include("first_name_kana is invalide")
    end
    it "family_name_kanaがアルファベットがあると登録できない" do
      @user = "Yamada"
      @user.valid?
      expect(@user.errors.full_messages).to include("family_name_kana is invalide")
    end
    it "first_name_kanaがアルファベットがあると登録できない" do
      @user = "Tarou"
      @user.valid?
      expect(@user.errors.full_messages).to include("first_name_kana is invalide")
    end
    it "birthが空では登録でいない" do
      @user = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("birth can't be blank")
    end
  end
end