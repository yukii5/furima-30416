require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
  context 'ユーザー登録ができるとき' do
    it 'nickname,email,password,password_confirmation,family_name,first_name,family_name_furikana,first_name_furikana,birthdayが存在すれば登録できる' do
      expect(@user).to be_valid
    end
    it 'パスワードが英数混合6文字以上であれば登録できる' do
      @user.password = 'aaa000'
      @user.password_confirmation = 'aaa000'
      expect(@user).to be_valid
    end
    it 'family_name,first_nameが漢字・ひらがな・カタカナであれば登録できる' do
      @user.family_name = 'あア亜'
      @user.first_name = 'あア亜'
      expect(@user).to be_valid
    end
    it 'family_name_furikana,first_name_furikanaがカタカナであれば登録できる' do
      @user.family_name_furikana = 'ア'
      @user.first_name_furikana =  'ア'
      expect(@user).to be_valid
    end
  end
  
  context 'ユーザー登録ができないとき' do
    it 'nicknameが空では登録できない' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it '既に登録されているemailでは登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailに＠が含まれていないと登録できない' do
      @user.email = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが空では登録できない' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordが数字だけでは登録できない' do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordがアルファベットだけでは登録できない' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwoed_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'password_confirmatiomがpasswordと同じでなければ登録できない' do
      @user.password_confirmation = '1a1a1a'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'family_nameが空では登録できない' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end
    it 'family_nameがアルファベットでは登録できない' do
      @user.first_name = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name は全角で入力して下さい')
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'first_nameがアルファベットでは登録できない' do
      @user.first_name = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name は全角で入力して下さい')
    end
    it 'family_name_furikanaが空では登録できない' do
      @user.family_name_furikana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name furikana can't be blank")
    end
    it 'family_name_furikanaがカタカナ以外では登録できない' do
      @user.family_name_furikana = 'あ亜a'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name furikana は全角カタカナのみで入力して下さい')
    end
    it 'first_name_furikanaが空では登録できない' do
      @user.first_name_furikana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name furikana can't be blank")
    end

    it 'first_name_furikanaがカタカナ以外では登録できない' do
      @user.first_name_furikana = 'あ亜a'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name furikana は全角カタカナのみで入力して下 さい')
    end
    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
    end
  end
end