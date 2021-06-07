require 'rails_helper'

RSpec.describe Like, type: :model do
  before do
    user = FactoryBot.create(:user)
    cat = FactoryBot.create(:cat)
    @photo = FactoryBot.create(:photo, user_id: user.id, cat_ids: cat.id)
    @like = FactoryBot.create(:like, photo: @photo)
    sleep(1) # Mysql2エラー防止
  end
  
  describe 'いいね機能' do
    context 'いいねができる時' do
      it 'user_idとphoto_idがあればいいねできる' do
        expect(@like).to be_valid
      end
      it '同じphoto_idでもuser_idが異なればいいねできる' do
        another_user = FactoryBot.build(:user)
        FactoryBot.create(:like, photo: @photo, user: another_user)
        expect(@like).to be_valid
      end
    end

    context 'いいねができない時' do
      it 'user_idがなければいいねできない' do
        @like.user_id = nil
        @like.valid?
        expect(@like.errors.full_messages).to include "Userを入力してください"
      end
      it 'photo_idがなければいいねできない' do
        @like.photo_id = nil
        @like.valid?
        expect(@like.errors.full_messages).to include "Photoを入力してください"
      end
    end
  end
end
