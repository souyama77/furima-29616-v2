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
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "emailの一意性" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
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
      @user.password = "hoge1"
      @user.password_confirmation ="hoge1"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordが英語のみでは登録できない" do
      @user.password = "hogeee"
      @user.password_confirmation = "hogeee"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "passwordが数字のみでは登録できない" do
      @user.password = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "passwordが全角では登録できない" do
      @user.password = "HOGEEE"
      @user.password_confirmation = "HOGEEE"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "passwordが半角英数字混合で無くては登録できない" do
      @user.password = "AAAA１１"
      @user.password_confirmation = "AAAA１１"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "passwordとpassword_confirmationが不一致では登録できない" do
      @user.password = "a12345"
      @user.password_confirmation = "a123456"
      @user.valid?
       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "family_nameが空では登録できない" do
      @user.family_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end
    it "first_nameが空では登録できない" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "family_nameが漢字、平仮名、カタカナ以外では登録できない" do
      @user.family_name = "Yamada"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name is invalid")
    end
    it "first_nameが漢字、平仮名、カタカナ以外では登録できない" do
      @user.first_name = "Tarou"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it "faimiy_name_kanaが空では登録できない" do
      @user.family_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end
    it "firdt_name_kanaが空では登録できない" do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "family_name_kanaが平仮名では登録できない" do
      @user.family_name_kana = "やまだ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana is invalid")
    end
    it "first_name_kanaが平仮名では登録できない" do
      @user.first_name_kana = "たろう"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
    it "family_name_kanaが漢字では登録できない" do
      @user.family_name_kana = "山田"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana is invalid")
    end
    it "first_name_kanaが漢字では登録できない" do
      @user.first_name_kana = "太郎"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
    it "family_name_kanaがアルファベットがあると登録できない" do
      @user.family_name_kana = "Yamada"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana is invalid")
    end
    it "first_name_kanaがアルファベットがあると登録できない" do
      @user.first_name_kana = "Tarou"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
    it "birthが空では登録でいない" do
      @user.birth = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth can't be blank")
    end
  end
end