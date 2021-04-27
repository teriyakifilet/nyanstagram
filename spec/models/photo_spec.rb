require 'rails_helper'

RSpec.describe Photo, type: :model do
  before do
    cat = FactoryBot.create(:cat)
    @photo = FactoryBot.build(:photo, cat_ids: cat.id )
  end

  describe '新規写真投稿機能' do
    context '写真が投稿できる時' do
      it '適切な情報が入力されていれば投稿できる' do
        expect(@photo).to be_valid
      end
      it 'コメントがなくても投稿できる' do
        @photo.detail = ''
        expect(@photo).to be_valid
      end
    end

    context '写真が投稿できない時' do
      it '写真がなければ投稿できない' do
        @photo.cat_photo = nil
        @photo.valid?
        expect(@photo.errors.full_messages).to include("Cat photo can't be blank")
      end
      it '対応するねこが選ばれていないと投稿できない' do
        @photo.cat_ids = ''
        @photo.valid?
        expect(@photo.errors.full_messages).to include("Cat ids can't be blank")
      end
    end
  end
end
