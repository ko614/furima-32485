require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmation、family_nameとfirst_name、family_name_kanaとfirst_name_kana、birth_dayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上の英数混合であれば登録できる" do
        @user.password = "00000a"
        @user.password_confirmation = "00000a"
        expect(@user).to be_valid
      end
      it "passwordが6文字以上の英数混合であれば登録できる" do
        @user.password = "00000a"
        @user.password_confirmation = "00000a"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空だと登録できない" do
        @user.email=""
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
      it "emailに＠がないと登録できない" do
        @user.email="test5gmail.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空では登録できない" do
        @user.password=""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが数字のみであれば登録できない" do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it "passwordは半角英語のみであれば登録できない" do
        @user.password = "aaaaaaa"
        @user.password_confirmation = "aaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordとpassword_confirmationは値が同じでないと登録出来ない" do
        @user.password = "000aaaa"
        @user.password_confirmation = "000bbbb"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "family_nameが空だと登録できない" do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it "family_nameはアルファベットだと登録できない" do
        @user.family_name = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name 全角文字を使用してください")
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "first_nameはアルファベットだと登録できない" do
        @user.first_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
      end
      it "family_name_kanaは空だと登録できない" do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end
      it "family_name_kanaはひらがなだと登録できない" do
        @user.family_name_kana = 'おおさわ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana はカタカナで入力して下さい。")
      end
      it "first_name_kanaは空だと登録できない" do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "first_name_kanaはひらがなだと登録できない" do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana はカタカナで入力して下さい。")
      end
      it "birth_dayは空だと登録できない" do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
  end
 end
end