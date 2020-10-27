require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録/ユーザー情報' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmation が存在すれば登録できる" do
        expect(@user).to be_valid
      end
      # emailの@があるときに登録できるは、上記の存在登録と下記の@ないときに登録できない反証で記入必要ないと判断
      it "passwordが6文字以上かつ英数字混合かつpassword_confirmation と一致であればであれば登録できる" do
        @user.password = "000aaa"
        @user.password_confirmation = "000aaa"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailに@がない場合登録できない" do
        @user.email = "aaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "aaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "password半角英数字混合でないと登録できない" do
        @user.password = "aaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordとpassword_confirmationが一致していないと登録できない" do
        @user.password_confirmation = "aaaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end 
    end
  end
  describe 'ユーザー新規登録/本人情報確認' do
    context '新規登録がうまくいくとき' do
      it "first_name、last_name、first_name_kana、last_name_kana、birth_day が存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "first_name、last_name、が全角であれば登録できる" do
        @user.first_name = "森"
        @user.last_name = "川"
        expect(@user).to be_valid
      end
      it "first_name_kana、last_name_kanaが全角であれば登録できる" do
        @user.first_name_kana = "モリ"
        @user.first_name_kana = "カワ"
        expect(@user).to be_valid
      end
      it "birth_dayが選択されていれば登録できる" do
        @user.birth_day = "1930-01-01"
        expect(@user).to be_valid
      end
      
    end
    context '新規登録がうまくいかないとき' do
      it "first_nameが空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "last_nameが空だと登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "first_nameが全角(漢字・ひらがな・カタカナ)でないと登録できない" do
        @user.first_name = "yamada"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
      end
      it "last_nameが全角(漢字・ひらがな・カタカナ)でないと登録できない" do
        @user.last_name = "tarou"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
      end
      it "first_name_kanaが空だと登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "last_name_kanaが空だと登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "first_name_kanaが全角(カタカナ)でないと登録できない" do
        @user.first_name_kana = "ﾔﾏﾀﾞ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana 全角カタカナを使用してください")
      end
      it "last_name_kanaが全角(カタカナ)でないと登録できない" do
        @user.last_name_kana = "ﾀﾛｳ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana 全角カタカナを使用してください")
      end 
      it "birth_dayが選択されていなければ登録できない" do
        @user.birth_day = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end
end
