require 'rails_helper'

RSpec.describe PurchaserecordAddress, type: :model do
  before do
    @purchaserecord_address = FactoryBot.build(:purchaserecord_address)
  end

  describe '商品購入' do
    context '購入がうまくいくとき' do
      it 'token、postal_code、prefecture_id、municipality、address、phone_numberが存在すれば購入できる' do
        expect(@purchaserecord_address).to be_valid
      end

      it 'building_nameがなくても購入できる' do
        expect(@purchaserecord_address).to be_valid
      end
    end

    context '購入がうまくいかないとき' do
      it 'tokenが空だと購入できない' do
        @purchaserecord_address.token = nil
        @purchaserecord_address.valid?
        expect(@purchaserecord_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'postal_codeが空だと購入できない' do
        @purchaserecord_address.postal_code = nil
        @purchaserecord_address.valid?
        expect(@purchaserecord_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'prefecture_idが１だと購入できない' do
        @purchaserecord_address.prefecture_id = 1
        @purchaserecord_address.valid?
        expect(@purchaserecord_address.errors.full_messages).to include('Prefecture Select')
      end

      it 'municipalityが空だと購入できない' do
        @purchaserecord_address.municipality = nil
        @purchaserecord_address.valid?
        expect(@purchaserecord_address.errors.full_messages).to include("Municipality can't be blank")
      end

      it 'addressが空だと購入できない' do
        @purchaserecord_address.address = nil
        @purchaserecord_address.valid?
        expect(@purchaserecord_address.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空だと購入できない' do
        @purchaserecord_address.phone_number = nil
        @purchaserecord_address.valid?
        expect(@purchaserecord_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'postal_codeにハイフンがないと購入できない' do
        @purchaserecord_address.postal_code = 111_111
        @purchaserecord_address.valid?
        expect(@purchaserecord_address.errors.full_messages).to include('Postal code Input correctly')
      end

      it 'phone_numberにハイフンが入っていると購入できない' do
        @purchaserecord_address.phone_number = '090-1234-56'
        @purchaserecord_address.valid?
        expect(@purchaserecord_address.errors.full_messages).to include('Phone number Input only number')
      end

      it 'user_idが空だと購入できない' do
        @purchaserecord_address.user_id = ''
        @purchaserecord_address.valid?
        expect(@purchaserecord_address.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空だと購入できない' do
        @purchaserecord_address.item_id = ''
        @purchaserecord_address.valid?
        expect(@purchaserecord_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
