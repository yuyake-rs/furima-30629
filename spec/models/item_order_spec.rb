require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      user_2 = FactoryBot.create(:user)
      @item_order = FactoryBot.build(:item_order, user_id: user_2.id, item_id: item.id)
      sleep(1)
    end
    context '新規登録がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@item_order).to be_valid
      end
      it '建物名が抜けていても保存できること' do
        @item_order.building = nil
        expect(@item_order).to be_valid
      end
    end
    context '新規登録がうまくいかないとき' do
      it 'user_idが空では登録できないこと' do
        @item_order.user_id = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では登録できないこと' do
        @item_order.item_id = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Item can't be blank")
      end

      it 'tokenが空では登録できないこと' do
        @item_order.token = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Token can't be blank")
      end
      it 'post_codeが空だと保存できない' do
        @item_order.post_code = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @item_order.post_code = '0000000'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Post code 郵便番号は、ハイフン半角(-)を入れて半角数字７桁で入力してください')
      end
      it 'ship_from_location_idが0以外でないと保存できない' do
        @item_order.ship_from_location_id = 0
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Ship from location 都道府県を選択してください')
      end
      it 'cityが空だと保存できない' do
        @item_order.city = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('City 市町村は、全角文字を使用してください')
      end
      it 'blockが空だと保存できない' do
        @item_order.block = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Block can't be blank")
      end
      it 'phone_numberが空だと保存できない' do
        @item_order.phone_number = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberは11桁以内でないと保存できない' do
        @item_order.phone_number = '000111000222'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Phone number 電話番号は、11桁以内で入力してください')
      end
      it 'phone_numberはハイフンがあると保存できない' do
        @item_order.phone_number = '000-0000000'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Phone number 電話番号は、半角ハイフン(-)なしで入力してください')
      end
    end
  end
end
