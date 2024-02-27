require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  describe '配送先情報の保存' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        
      end
      it 'user_idが空でなければ保存できる' do
        
      end
      it 'item_idが空でなければ保存できる' do
      end


    end

    context '内容に問題がある場合' do
      it "priceが空では保存ができないこと" do
        
      end

      it 'トークンが空だと保存できないこと' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
    end

  end  
 
end
