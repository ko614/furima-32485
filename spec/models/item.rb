require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it "name、image,description、status_id,category_id、delivery_fee_id、ship_form_id、shipping_day_id、priceがあれば登録できる" do
        expect(@item).to be_valid
      end
      
      
    end

    context '商品出品がうまくいかないとき' do
      it "imageが空だと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "nameが空だと出品できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "descriptionが空だと出品できない" do
        @item.description=""
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "category_idが”--”だと出品できない" do
        @item.category_id= 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "category_idが空だと出品できない" do
        @item.category_id= ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "status_idが”--”だと出品できない" do
        @item.status_id= 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end
      it "status_idが空だと出品できない" do
        @item.status_id= ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it "delivery_fee_idが”--”だと出品できない" do
        @item.delivery_fee_id= 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
      end
      it "delivery_fee_idが空だと出品できない" do
        @item.delivery_fee_id= ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery can't be blank")
      end
      it "ship_form_idが”--”だと出品できない" do
        @item.ship_form_id= 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship form must be other than 0")
      end
      it "ship_form_idが空だと出品できない" do
        @item.ship_form_id= ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship can't be blank")
      end
      it "shipping_day_idが”--”だと出品できない" do
        @item.shipping_day_id= 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day must be other than 1")
      end
      it "shipping_day_idが空だと出品できない" do
        @item.shipping_day_id= ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping can't be blank")
      end
      it "priceが空だと出品できない" do
        @item.price= nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが全角数字だと出品できない" do
        @item.price= "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は半角数字で入力して下さい。")
      end
      it "10,000,000以上だと出品できない" do
        @item.price= 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は半角数字で入力して下さい。")
      end
  end
 end
end