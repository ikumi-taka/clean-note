require 'rails_helper'

RSpec.describe Housework, type: :model do
  before do
    @housework = FactoryBot.build(:housework)
  end

  describe '掃除記録ページの作成' do
    context '掃除記録ページの作成ができるとき'do
      it 'housework_nameとimageが存在していれば登録ができる' do
        expect(@housework).to be_valid
      end
    end
    context '掃除記録ページの作成ができないとき'do
      it 'housework_nameが空だと登録できない' do
        @housework.housework_name = ''
        @housework.valid?
        expect(@housework.errors.full_messages).to include("Housework name can't be blank")
      end
      it 'imageが空だと登録できない' do
        @housework.image = nil
        @housework.valid?
        expect(@housework.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end

