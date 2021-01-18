class BuyDestinationController < ApplicationController
  before_action :authenticate_user!, only: [:index]


  def index
    @item = Item.find(params[:item_id])

    unless @item.buy == nil
      redirect_to root_path
    end

    

    if @item.user.id == current_user.id
      redirect_to root_path
    else
      @buy_destination = BuyDestination.new 
    end

  end
 
  def new
    
  end
 
  def create
    @item = Item.find(params[:item_id])
    @buy_destination = BuyDestination.new(destination_params) 
     if @buy_destination.valid?
      pay_item
      
       @buy_destination.save
       redirect_to root_path
     else
       render action: :index
     end
  end
 
  private
   
  def destination_params
   params.require(:buy_destination).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
  
  def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,  
        card: destination_params[:token],    
        currency: 'jpy'               
      )
    end

end
