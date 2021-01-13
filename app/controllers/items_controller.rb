class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:edit]
  before_action :set_item,only: [:show,:edit,:update]


  def index
    @items = Item.all.order("created_at DESC")

  end

  def new
    
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
      
  end


  def edit
    unless @item.user.id == current_user.id
      redirect_to root_path
     end
    
  end

  def update
    @item.update(item_params)
    if @item.save
      render :show
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:content, :image,:name,:description,:category_id,:status_id,:delivery_fee_id,:ship_form_id,:shipping_day_id,:price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end


  
end