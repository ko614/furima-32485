require 'rails_helper'
describe BuyDestination do
  before do
    @buy_destination = FactoryBot.build(:buy_destination)
  end

  describe '商品購入' do
    context '商品購入がうまくいくとき' do
      it "token、post_code、prefecture_id、cityとaddress、phone_number、building_nameが存在すれば登録できる" do
        expect(@buy_destination).to be_valid
      end
      it "building_nameが空でも登録できる" do
        @buy_destination.building_name = ''
        expect(@buy_destination).to be_valid
      end
      
      
    end

    context '商品購入がうまくいかないとき' do
      it "tokenが空だと購入できない" do
        @buy_destination.token = nil
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include("Token can't be blank")
      end
      it "post_codeが空だと購入できない" do
        @buy_destination.post_code = ''
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include("Post code can't be blank")
      end
      it "post_codeにーがないと購入できない" do
        @buy_destination.post_code = '2430427'
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it "prefecture_idが”--”だと購入できない" do
        @buy_destination.prefecture_id = 0
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include("Prefecture 0以外を入力してください")
      end
      it "cityが空だと購入できない" do
        @buy_destination.city = ''
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include("City can't be blank")
      end
      it "addressが空だと購入できない" do
        @buy_destination.address= ''
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include("Address can't be blank")
      end
      it "phone_numberが空では購入できない" do
        @buy_destination.phone_number= ''
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include("Phone number can't be blank")
      end
      it "phone_numberは数字以外購入できない" do
        @buy_destination.phone_number= 'aaaaaaaaaaa'
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include("Phone number 電話番号は数字のみの１１桁以内で入力してください")
      end
      it "phone_numberが11桁以上は購入できない" do
        @buy_destination.phone_number= '080126633789'
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include("Phone number 電話番号は数字のみの１１桁以内で入力してください")
      end
      it "user_idが無いと購入できない" do
        @buy_destination.user_id = nil
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include("User can't be blank")
      end
      it "item_idが無いと購入できない" do
        @buy_destination.item_id = nil
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include("Item can't be blank")
      end

    
      
  end
 end
end