class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_index, only: [:index]
  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order = Order.new(order_params)
    binding.pry
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      redirect_to item_orders_path
    end
  end

  private
  def order_params
    params.require(:order).permit(:postal_code,:prefecture_id,:city,:house_number,:building_name,:phone_number).merge(token: params[:token])
  end

  def move_index
    item = Item.find(params[:item_id])
    redirect_to action: :index if user_signed_in? && current_user.id == item.user.id
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.item_price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end