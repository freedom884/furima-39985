require 'rails_helper'

RSpec.describe Address, type: :model do
    before do
      @order = create(:order)  # FactoryBotを使用してOrderを作成
      @address = build(:address, order: @order)
    end
  describe '配送先情報の保存' do
    context '配送先情報の保存ができるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@address).to be_valid
      end
      it 'user_idが空でなければ保存できる' do
        @address.user_id = 1
        expect(@address).to be_valid
      end
      it 'product_idが空でなければ保存できる' do
        @address.product_id = 1
        expect(@address).to be_valid
      end
      it '郵便番号が「3桁＋ハイフン＋4桁」の組み合わせであれば保存できる' do
        @address.post_code = '123-4560'
        expect(@address).to be_valid
      end
      it '都道府県が「---」以外かつ空でなければ保存できる' do
        @address.prefecture_id = 1
        expect(@address).to be_valid
      end
      it '市区町村が空でなければ保存できる' do
        @address.city = '横浜市'
        expect(@address).to be_valid
      end
      it '番地が空でなければ保存できる' do
        @address.house_number = '旭区１２３'
        expect(@addresss).to be_valid
      end
      it '建物名が空でも保存できる' do
        @address.building_name = nil
        expect(@address).to be_valid
      end
      it '電話番号が11番桁以内かつハイフンなしであれば保存できる' do
        @address.phone_number = 12_345_678_910
        expect(@address).to be_valid
      end
    end

    context '配送先情報の保存ができないとき' do
      it 'user_idが空だと保存できない' do
        @address.user_id = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("User can't be blank")
      end
      it 'product_idが空だと保存できない' do
        @address.product_id = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Product can't be blank")
      end
      it '郵便番号が空だと保存できないこと' do
        @address.post_code = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Postcode can't be blank", 'Postcode is invalid. Include hyphen(-)')
      end
      it '郵便番号にハイフンがないと保存できないこと' do
        @address.post_code = 1_234_567
        @address.valid?
        expect(@address.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
      end
      it '都道府県が「---」だと保存できないこと' do
        @address.prefecture_id = 0
        @address.valid?
        expect(@address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '都道府県が空だと保存できないこと' do
        @shipping_address.prefecture_id = nil
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空だと保存できないこと' do
        @address.city = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @address.house_number = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @address.phone_number = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号にハイフンがあると保存できないこと' do
        @shipping_address.phone_number = '123 - 1234 - 1234'
        @shipping_address.valid?
        expect(@address.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が12桁以上あると保存できないこと' do
        @address.phone_number = 12_345_678_910_123_111
        @address.valid?
        expect(@address.errors.full_messages).to include('Phone number is invalid')
      end
      
    end
  end


end
