class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_item_index, only: [:index, :create]

  def index
  end
  
  def create
    @order_location = OrderLocation.new()
    

  end
  
  private

  def move_to_item_index
    @item = Item.find(params[:item_id])
    redirect_to root_path unless current_user == @item.user
  end

  def order_params
    params.require(:order_location).permit(:postal_code, :province_id, :city, :address_line1, :address_line2, :phone_number).merge(item_id: @item.id, user_id: current_user.id)
  end
end
