require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザ情報の保存' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '新規登録/ユーザ情報' do
      it '全ての値が正しく入力されていれば保存できる' do
        expect(@user).to be_valid
      end

      it 'nicknameが空だと保存できないこと' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では保存ができないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailが重複していると保存ができないこと' do
        @user.save
        user_another = FactoryBot.build(:user)
        user_another.email = @user.email
        user_another.valid?
        expect(user_another.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailが＠を含まないと保存ができないこと' do
        @user.email = 'aaa.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが空では保存できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが6文字以上でないと保存できないこと' do
        @user.password = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが半角英数混合でないと保存できないこと' do
        @user.password = 'aaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end

      it 'passwordが存在してもpassword_confirmationが空だと保存できないこと' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordとpassword_confirmationが一致しないと保存できないこと' do
        @user.password_confirmation = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end

    context '新規登録/本人情報確認' do
      it 'name_firstが空だと保存できないこと' do
        @user.name_first = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name first can't be blank")
      end

      it 'name_firstが全角日本語でないと保存できないこと' do
        @user.name_first = 'suzuki'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name first is invalid. Input full-width characters.')
      end

      it 'name_lastが空だと保存できないこと' do
        @user.name_last = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name last can't be blank")
      end

      it 'name_lastが全角日本語でないと保存できないこと' do
        @user.name_last = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name last is invalid. Input full-width characters.')
      end

      it 'name_reading_firstが空だと保存できないこと' do
        @user.name_reading_first = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name reading first can't be blank")
      end

      it 'name_reading_fisrtが全角日本語でないと保存できないこと' do
        @user.name_reading_first = 'ｽｽﾞｷ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name reading first is invalid. Input full-width katakana characters.')
      end

      it 'name_reading_lastが空だと保存できないこと' do
        @user.name_reading_last = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name reading last can't be blank")
      end

      it 'name_reading_lastが全角日本語でないと保存できないこと' do
        @user.name_reading_last = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name reading last is invalid. Input full-width katakana characters.')
      end

      it 'birthdayが空だと保存できないこと' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
