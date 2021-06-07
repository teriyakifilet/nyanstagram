require 'rails_helper'

RSpec.describe Relationship, type: :model do
  let(:relationship) { FactoryBot.create(:relationship) }

  describe 'フォロー機能' do
    context "フォローできる時" do
      it 'user_idとcat_idがあればフォローできる' do
        expect(relationship).to be_valid
      end
      it '同じcat_idでもuser_idが異なればフォローできる' do
        @another_user = FactoryBot.create(:user)
        @another_like = FactoryBot.create(:relationship, cat: relationship.cat, user:@another_user)
        expect(@another_like).to be_valid
      end
      it '同じuser_idでもcat_idが異なればフォローできる' do
        @another_cat = FactoryBot.create(:cat)
        @another_like = FactoryBot.create(:relationship, cat: @another_cat, user: relationship.user)
        expect(@another_like).to be_valid
      end
    end

    context "フォローできない時" do
      it 'user_idがなければフォローできない' do
        relationship.user = nil
        relationship.valid?
        expect(relationship.errors.full_messages).to include 'Userを入力してください'
      end
      it 'cat_idがなければフォローできない' do
        relationship.cat = nil
        relationship.valid?
        expect(relationship.errors.full_messages).to include "Catを入力してください"
      end
    end
  end
end
