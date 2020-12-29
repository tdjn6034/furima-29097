require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '出品がうまくいくとき' do
      it 'image、name、product_description、category_id、quality_id、delivery_fee_id、prefecture_id、days_to_ship_id、priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end

      context '出品がうまくいかないとき' do
        it 'imageが空だと登録できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it 'nameが空だと登録できない' do
          @item.name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end
        it 'product_descriptionが空だと登録できない' do
          @item.product_description = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Product description can't be blank")
        end
        it 'category_idが１だと登録できない' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Category Select')
        end
        it 'quality_idが１だと登録できない' do
          @item.quality_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Quality Select')
        end
        it 'delivery_fee_idが１だと登録できない' do
          @item.delivery_fee_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Delivery fee Select')
        end
        it 'prefecture_idが１だと登録できない' do
          @item.prefecture_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Prefecture Select')
        end
        it 'days_to_ship_idが１だと登録できない' do
          @item.days_to_ship_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Days to ship Select')
        end
        it 'priceが￥299以下の場合登録できない' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include('Price Out of setting range')
        end
        it 'priceが￥10,000,000以上の場合登録できない' do
          @item.price = 10_000_000
          @item.valid?
          expect(@item.errors.full_messages).to include('Price Out of setting range')
        end
        it 'priceが半角数字でないと登録できない' do
          @item.price = '１０００'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price Half-width number')
        end
        it 'userが紐づいていないと登録できない' do
          @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('User must exist')
        end
        it 'category_idが空では登録できない' do
          @item.category_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank", 'Category Select')
        end
        it 'quality_idが空では登録できない' do
          @item.quality_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Quality can't be blank", 'Quality Select')
        end
        it 'prefecture_idが空では登録できない' do
          @item.prefecture_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture can't be blank", 'Prefecture Select')
        end
        it 'delivery_fee_idが空では登録できない' do
          @item.delivery_fee_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery fee can't be blank", 'Delivery fee Select')
        end
        it 'days_to_ship_idが空では登録できない' do
          @item.days_to_ship_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Days to ship can't be blank", 'Days to ship Select')
        end
      end
    end
  end
end
