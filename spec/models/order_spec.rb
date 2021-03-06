require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order = FactoryBot.build(:order,user_id: @user.id,item_id: @item.id)
    sleep 0.1
  end

  describe '商品購入' do
    context '商品購入がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order).to be_valid
      end
      it '建物名がなくても保存できること' do
        @order.building_name = ''
        expect(@order).to be_valid
      end
    end

    context '商品購入がうまくいかない時' do
      it 'tokenが空では登録できないこと' do
        @order.token = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空では登録できないこと' do
        @order.user_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では登録できないこと' do
        @order.item_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
      it '配送先の情報として、郵便番号が空だと保存できないこと' do
        @order.post_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code can't be blank")
      end
      it '配送先の情報として、郵便番号がハイフン(−)を含んでいないとだと保存できないこと' do
        @order.post_code = '0010000'
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code is invalid")
      end
      it '配送先の情報として、都道府県が空だと保存できないこと' do
        @order.prefecture_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '配送先の情報として、都道府県のIDが１だと保存できないこと' do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it '配送先の情報として、市区町村が空だと保存できないこと' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it '配送先の情報として、番地が空だと保存できないこと' do
        @order.adress = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Adress can't be blank")
      end
      it '配送先の情報として電話番号が空だと保存できないこと' do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it '配送先の情報として電話番号がハイフン(−)を含んでいると保存できないこと' do
        @order.phone_number = '090-1234-5678'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is not a number")
      end
      it '配送先の情報として電話番号が12桁以上だと保存できないこと' do
        @order.phone_number = '123456789012'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が9桁以下では購入できないこと' do
        @order.phone_number = '123456789'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号に半角数字以外が含まれている場合は購入できないこと' do
        @order.phone_number = '123456789０12'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end