require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @product = FactoryBot.build(:product, user: @user)
  end

  describe '出品する' do
    
    context '出品登録ができるとき' do
      it '全ての入力事項が、存在すれば登録できる' do
      expect(@product).to be_valid
      end
      it 'カテゴリーが「---」以外であれば登録できる' do
        @product.category_id = 1
        expect(@product).to be_valid
      end
      it '商品の状態が「---」以外であれば登録できる' do
        @product.condition_id = 1
        expect(@product).to be_valid
      end
      it '発送元の地域が「---」以外であれば登録できる' do
        @product.prefecture_id = 1
        expect(@product).to be_valid
      end
      it '発送までの日数が「---」以外であれば登録できる' do
        @product.scheduleddelivery_id = 1
        expect(@product).to be_valid
      end
      it '価格が半角数字であれば登録できる' do
        @product.price = 1000
        expect(@product).to be_valid
      end
      it '価格が300円以上であれば登録できる' do
        @product.price = 500 
        expect(@product).to be_valid
      end
      it '価格が9,999,999円までであれば登録できる' do
        @product.price = 5_000_000 
        expect(@product).to be_valid
      end
    end 

    context '出品ができないとき' do
      it 'ユーザー登録している人でないと出品できない' do
      end
      it '画像が空だと出品できない' do
      @product.image = nil
      @product.valid?
       expect(@product.errors.full_messages).to include ("Image can't be blank") 
      end
      it '商品名が空欄だと出品できない' do
          @product.name = ''
          @product.valid?
          expect(@product.errors.full_messages).to include ( "Name can't be blank")
      end
      it '商品の説明が空欄だと出品できない' do
          @product.description = ''
          @product.valid?
          expect(@product.errors.full_messages).to include ("Description can't be blank")
      end
      it 'カテゴリーの情報が空欄だと出品できない' do
        @product.category_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end
      it 'カテゴリーが「---」を選択した状態では保存できない' do
        @product.category_id = Category.find_by(name: '---').id
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end
      it "商品の状態が「---」を選択した状態では保存できない" do
        @product.condition_id = Condition.find_by(condition: '---').id 
        @product.valid?
        expect(@product.errors.full_messages).to include("Condition can't be blank")
      end
      it '商品の状態の情報が空欄だと出品できない' do
        @product.condition_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Condition can't be blank")
      end
      it "配送料の負担が「---」を選択した状態では保存できない" do
        @product.shippingfee_id = Shippingfee.find_by(name: '---').id 
        @product.valid?
        expect(@product.errors.full_messages).to include("Shippingfee can't be blank")
      end
      it '配送料の負担の情報が空欄だと出品できない' do
        @product.shippingfee_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Shippingfee can't be blank")
      end
      it '発送元の地域の情報が空欄だと出品できない' do
        @product.prefecture_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "配送元が「---」を選択した状態では保存できない" do
        @product.prefecture_id = Prefecture.find_by(name: '---').id 
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "発送までの日数が「---」を選択した状態では保存できない" do
        @product.scheduleddelivery_id = Scheduleddelivery.find_by(name: '---').id 
        @product.valid?
        expect(@product.errors.full_messages).to include("Scheduleddelivery can't be blank")
      end
      it '価格が空欄だと出品できない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include ("Price can't be blank")
      end
      it "価格に半角数字以外が含まれている場合は出品できない" do
        @product.price =  'wa５5'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not a number")
      end
      it '価格の範囲が、300円未満だと出品できない' do
        @product.price = 100
        @product.valid?
        expect(@product.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '価格の範囲が、9,999,999円を超えると出品できない' do
        @product.price = 10_000_000
        @product.valid?
        expect(@product.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

    end
  end 
    
end

