require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#create" do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'nickname、first_name、last_name、first_name_katakana、last_name_katakana、birthday、email、passwordとpassword_confirmationが存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できないこと' do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    
    it 'first_nameが空では登録できないこと' do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'last_nameが空では登録できないこと' do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'first_name_katakanaが空では登録できないこと' do
      @user.first_name_katakana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name katakana can't be blank")
    end

    it 'last_name_katakanaが空では登録できないこと' do
      @user.last_name_katakana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name katakana can't be blank")
    end

    it 'birthdayが空では登録できないこと' do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

    it 'emailが空では登録できないこと' do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordが空では登録できないこと' do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが5文字以下であれば登録できないこと' do
       @user.password = "111aa"
       @user.password_confirmation = "111aa"
       @user.valid?
       expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "passwordに全角が含まれると登録できないこと" do
      @user.password = "111１aaa"
      @user.password_confirmation = "111１aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password include both letters and numbers")
    end

    it "passwordに英語がなければ登録できないこと" do
      @user.password = "149320"
      @user.password_confirmation = "149320"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password include both letters and numbers")
    end

    it "passwordに数字がなければ登録できないこと" do
      @user.password = "asdfgh"
      @user.password_confirmation = "asdfgh"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password include both letters and numbers")
    end

    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = "111aaa"
      @user.password_confirmation = "112aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "first_nameが全角でなければ登録できないこと" do
      @user.first_name = "ﾀｶｼ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name please enter in full letters")
    end

    it "last_nameが全角でなければ登録できないこと" do
      @user.last_name = "tanaka"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name please enter in full letters")
    end

    it "first_name_katakanaが全角でなければ登録できないこと" do
      @user.first_name_katakana = "ﾀｶｼ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name katakana please enter in full-width katakana")
    end

    it "first_name_katakanaがカタカナでなければ登録できないこと" do
      @user.first_name_katakana = "たかし"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name katakana please enter in full-width katakana")
    end

    it "last_name_katakanaが全角でなければ登録できないこと" do
      @user.first_name_katakana = "tanaka"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name katakana please enter in full-width katakana")
    end

    it "last_name_katakanaがカタカナでなければ登録できないこと" do
      @user.first_name_katakana = "ｔａｎａｋａ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name katakana please enter in full-width katakana")
    end
  end
end
