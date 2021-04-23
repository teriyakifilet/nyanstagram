# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Cat, type: :model do
  before do
    @cat = FactoryBot.build(:cat)
  end

  describe 'ねこ新規登録機能' do
    context 'ねこ新規登録ができる時' do
      it '適切な情報が入力されていれば新規登録できる' do
        expect(@cat).to be_valid
      end
      it 'ねこの年齢が入力されていなくても新規登録できる' do
        @cat.cat_age = ''
        expect(@cat).to be_valid
      end
    end

    context 'ねこ新規登録ができない時' do
      it 'ねこの名前が入力されていないと新規登録できない' do
        @cat.cat_name = ''
        @cat.valid?
        expect(@cat.errors.full_messages).to include "Cat name can't be blank"
      end
      it 'ねこの性別が選ばれていないと新規登録できない' do
        @cat.cat_sex_id = 1
        @cat.valid?
        expect(@cat.errors.full_messages).to include 'Cat sex must be other than 1'
      end
      it 'ねこの品種が選ばれていないと新規登録できない' do
        @cat.cat_breed_id = 1
        @cat.valid?
        expect(@cat.errors.full_messages).to include 'Cat breed must be other than 1'
      end
      it 'ねこのアイコンが添付されてないと新規登録できない' do
        @cat.icon = nil
        @cat.valid?
        expect(@cat.errors.full_messages).to include "Icon can't be blank"
      end
      it 'ねこの年齢が全角では新規登録できない' do
        @cat.cat_age = '２さい'
        @cat.valid?
        expect(@cat.errors.full_messages).to include 'Cat age is not a number'
      end
      it 'ねこの年齢が英数字混合では新規登録できない' do
        @cat.cat_age = '2 years old'
        @cat.valid?
        expect(@cat.errors.full_messages).to include 'Cat age is not a number'
      end
    end
  end
end
