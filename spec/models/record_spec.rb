require 'rails_helper'

RSpec.describe Record, type: :model do
  before do
    @record = FactoryBot.build(:record)
  end

  describe '記録投稿' do
    context '記録するための投稿ができるとき'do
      it 'contentが存在していれば登録ができる' do
        expect(@record).to be_valid
      end
    end
    context '記録するための投稿ができないとき'do
      it 'contentが空だと登録できない' do
        @record.content = ''
        @record.valid?
        expect(@record.errors.full_messages).to include("Content can't be blank")
      end
      it 'houseworkが紐付いていないと保存できない' do
        @record.housework = nil
        @record.valid?
        expect(@record.errors.full_messages).to include("Housework must exist")
      end
      it 'userが紐付いていないと保存できない' do
        @record.user = nil
        @record.valid?
        expect(@record.errors.full_messages).to include("User must exist")
      end
    end
  end
end
