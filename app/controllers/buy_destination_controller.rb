class BuyDestinationController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @buy_destination = BuyDestination.new 

  end
 
  def new
  end
 
  def create

    @buy_destination = BuyDestination.new(destination_params)   #「UserDonation」に編集
     if @buy_destination.valid?
       @buy_destination.save
       redirect_to root_path
     else
       render action: :index
     end
  end
 
  private
   # 全てのストロングパラメーターを1つに統合
  def destination_params
   params.require(:buy_destination).permit(:post_code, :prefecture_id, :city, :address, :building_name,:phone_number).merge(user_id: current_user.id,item_id: params[:item_id])
  end
 #params { buy_destination=>{post_code=>1, ~~~~}, item_id => 1}
 #
 
end
