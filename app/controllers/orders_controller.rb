class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_index, only: [:index]
  def index
    @order = OrderBuyer.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order_buyer = OrderBuyer.new(order_params)
    if @order_buyer.valid?
      pay_item
      @order_buyer.save
      redirect_to root_path
    else
      redirect_to item_orders_path
    end
  end

  private

  def order_params
    item = Item.find(params[:item_id])
    params.require(:order_buyer).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: item.id)
  end

  def move_index
    item = Item.find(params[:item_id])
    redirect_to action: :index if user_signed_in? && current_user.id == item.user.id
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.item_price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
