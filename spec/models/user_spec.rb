# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録機能' do
    context 'ユーザー新規登録ができる時' do
      it '適切な情報が入力されていれば新規登録できる' do
        expect(@user).to be_valid
      end
      it 'ユーザーのプロフィールが入力されていなくても新規登録できる' do
        @user.user_profile = ''
        expect(@user).to be_valid
      end
    end

    context 'ユーザー新規登録ができない時' do
      it 'ユーザー名が入力されていないと新規登録できない' do
        @user.user_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "ユーザー名を入力してください"
      end
      it 'メールアドレスが入力されていないと新規登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Eメールを入力してください"
      end
      it 'メールアドレスに@が含まれていないと新規登録できない' do
        @user.email = 'test.com'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Eメールは不正な値です'
      end
      it 'すでに登録されているメールアドレスでは新規登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'Eメールはすでに存在します'
      end
      it 'パスワードが入力されていないと新規登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードを入力してください"
      end
      it 'パスワードが全角だと登録できない' do
        @user.password = '１２３４５６'
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワードには英字と数字の両方を含めて設定してください'
      end
      it 'パスワードが半角英字だけだと登録できない' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワードには英字と数字の両方を含めて設定してください'
      end
      it 'パスワードが半角数字だけだと登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワードには英字と数字の両方を含めて設定してください'
      end
      it 'パスワードが6文字以下だと登録できない' do
        @user.password = 'abc1'
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワードは6文字以上で入力してください'
      end
      it 'パスワード確認が入力されていないと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワード（確認用）とパスワードの入力が一致しません"
      end
      it 'パスワードと確認用が一致しないと登録できない' do
        @user.password = 'abc123'
        @user.password_confirmation = '123abc'
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワード（確認用）とパスワードの入力が一致しません"
      end
      it 'ユーザー名が4文字以下だと登録できない' do
        @user.user_name = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include 'ユーザー名は4文字以上で入力してください'
      end
      it 'ユーザー名が33文字以上だと登録できない' do
        @user.user_name = Faker::Name.initials(number: 33)
        @user.valid?
        expect(@user.errors.full_messages).to include 'ユーザー名は32文字以内で入力してください'
      end
      it 'プロフィールが256文字以上だと登録できない' do
        @user.user_profile = Faker::Lorem.characters(number: 256)
        @user.valid?
        expect(@user.errors.full_messages).to include 'プロフィールは255文字以内で入力してください'
      end
    end
  end
end
