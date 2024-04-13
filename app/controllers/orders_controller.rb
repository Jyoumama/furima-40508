class OrdersController < ApplicationController
  before_action :authenticate_user!,except: [:index, :create]
  before_action :set_item


  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      set_item
      render :index, status: :unprocessable_entity
    end 
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id,item_id:params[:item_id])
  end
end
