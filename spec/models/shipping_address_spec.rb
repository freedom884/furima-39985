require 'rails_helper'

RSpec.describe ShippingAddress, type: :model do
  before do
      @user = FactoryBot.create(:user)
      @product = FactoryBot.create(:product, user: @user)
      @shipping_address = FactoryBot.build(:shipping_address, user_id: @user.id, product_id: @product.id)
   end  

  describe '配送先情報の保存' do

    context '配送先の情報の保存がうまくいくとき' do
      it '郵便番号、住所（都道府県、市町村、番地）、電話番号、購入ユーザーid、購入商品id、トークンが存在すれば登録できる' do
        expect(@shipping_address).to be_valid 
      end
      it '郵便番号が「3桁＋ハイフン＋4桁」の組み合わせであれば保存できる' do
          @shipping_address.post_code ='123-4560'
          expect(@shipping_address).to be_valid
      end
      it '都道府県が「---」以外かつ空でなければ保存できる' do
        @shipping_address.prefecture_id = 1
        expect(@shipping_address).to be_valid
      end
      it '市区町村が空でなければ保存できる' do
          @shipping_address.city = '横浜市'
          expect(@shipping_address).to be_valid
      end
      it '番地が空でなければ保存できる' do
          @shipping_address.house_number ='旭区１２３'
          expect(@shipping_address).to be_valid
      end
      it '建物名が空でも保存できる' do
          @shipping_address.building_name =''
          expect(@shipping_address).to be_valid
      end
      it '電話番号が11番桁以内かつハイフンなしであれば保存できる' do
          @shipping_address.phone_number =12_345_678_910
          expect(@shipping_address).to be_valid
      end
    end
  
    context '配送先情報の保存ができないとき' do
      it '郵便番号が空だと保存できないこと' do
        @shipping_address.post_code = '3310804'
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include('Post code は3桁ハイフン4桁の形式で入力してください')
      end
      it '郵便番号に「-」がないと登録できない' do
        @shipping_address.post_code ='3310804'
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include('Post code は3桁ハイフン4桁の形式で入力してください')
      end
      it '都道府県が「---」だと保存できないこと' do
          @shipping_address.prefecture_id = 0
          @shipping_address.valid?
          expect(@shipping_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '都道府県が空だと保存できないこと' do
          @shipping_address.prefecture_id = nil
          @shipping_address.valid?
          expect(@shipping_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空だと保存できないこと' do
          @shipping_address.city = nil
          @shipping_address.valid?
          expect(@shipping_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できないこと' do
          @shipping_address.house_number = ''
          @shipping_address.valid?
          expect(@shipping_address.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
          @shipping_address.phone_number = nil
          @shipping_address.valid?
          expect(@shipping_address.errors.full_messages).to include("Phone number can't be blank")
      end


      it '電話番号にハイフンがあると保存できないこと' do
        @shipping_address.phone_number='090-12345678'
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include('Phone number は10桁以上11桁以内で入力してください')
      end
      it '電話番号が12桁以上あると保存できないこと' do
        @shipping_address.phone_number='1234567890123'
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include('Phone number は10桁以上11桁以内で入力してください')
      end
      it 'tokenが空だと購入できない' do
        @shipping_address.token = ''
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end