require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context '商品登録ができる時' do
    it '必須項目が全てあれば登録できること' do
      expect(@item).to be_valid
    end
  end
  context '商品登録ができない時' do
    it 'nameがない場合は登録できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors[:name]).to include("can't be blank")
    end

    it 'detailがない場合は登録できないこと' do
      @item.detail = nil
      @item.valid?
      expect(@item.errors[:detail]).to include("can't be blank")
    end

    it 'category_idがない場合は登録できないこと' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors[:category_id]).to include("can't be blank")
    end

    it 'category_idで「---」に対応idが選択された場合は登録できないこと' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors[:category_id]).to include("can't be blank")
    end

    it 'sales_status_idがない場合は登録できないこと' do
      @item.sales_status_id = nil
      @item.valid?
      expect(@item.errors[:sales_status_id]).to include("can't be blank")
    end

    it 'sales_status_idで「---」に対応idが選択された場合は登録できないこと' do
      @item.sales_status_id = 1
      @item.valid?
      expect(@item.errors[:sales_status_id]).to include("can't be blank")
    end

    it 'prefecture_idがない場合は登録できないこと' do
      @item.prefecture_id = nil
      @item.valid?
      expect(@item.errors[:prefecture_id]).to include("can't be blank")
    end

    it 'prefecture_idで「---」に対応idが選択された場合は登録できないこと' do
      @item.prefecture_id = 0
      @item.valid?
      expect(@item.errors[:prefecture_id]).to include("can't be blank")
    end

    it 'scheduled_delivery_idがない場合は登録できないこと' do
      @item.scheduled_delivery_id = nil
      @item.valid?
      expect(@item.errors[:scheduled_delivery_id]).to include("can't be blank")
    end

    it 'scheduled_delivery_idで「---」に対応idが選択された場合は登録できないこと' do
      @item.scheduled_delivery_id = 1
      @item.valid?
      expect(@item.errors[:scheduled_delivery_id]).to include("can't be blank")
    end

    it 'shipping_fee_status_idがない場合は登録できないこと' do
      @item.shipping_fee_status_id = nil
      @item.valid?
      expect(@item.errors[:shipping_fee_status_id]).to include("can't be blank")
    end

    it 'shipping_fee_status_idで「---」に対応idが選択された場合は登録できないこと' do
      @item.shipping_fee_status_id = 1
      @item.valid?
      expect(@item.errors[:shipping_fee_status_id]).to include("can't be blank")
    end

    it 'priceがない場合は登録できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors[:price]).to include("can't be blank")
    end

    it 'priceがinteger以外ならNG' do
      @item.price = '３００'
      @item.valid?
      expect(@item.errors[:price]).to include('is not a number')
    end

    it 'priceが300円未満ならNG' do
      @item.price = '290'
      @item.valid?
      expect(@item.errors[:price]).to include('must be greater than or equal to 300')
    end

    it 'priceが9999999円よりも高額ならNG' do
      @item.price = '19999999'
      @item.valid?
      expect(@item.errors[:price]).to include('must be less than or equal to 9999999')
    end

    it '画像が空だと登録できない' do
      @item = build(:item)
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'ユーザーが紐付いていなければ投稿できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end
  end
end
