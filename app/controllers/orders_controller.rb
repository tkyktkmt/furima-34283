class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_item_index, only: [:index, :create]

  def index
    @order_location = OrderLocation.new
  end
  
  def create
    @order_location = OrderLocation.new(order_params)
    if @order_location.valid?
      pay_item
      @order_location.save 
      redirect_to root_path
    else  
      render :index
    end
  end
  
  private

  def move_to_item_index
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user == @item.user or  @item.order != nil
  end

  def order_params
    params.require(:order_location).permit(:postal_code, :province_id, :city, :address_line1, :address_line2, :phone_number).merge(item_id: @item.id, user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
