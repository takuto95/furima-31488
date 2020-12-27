class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_params
  before_action :move, only: [:index]
  def index
    @order_buyer = OrderBuyer.new
  end

  def create
    @order_buyer = OrderBuyer.new(order_params)
    if @order_buyer.valid?
      pay_item
      @order_buyer.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def item_params
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_buyer).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: @item.id)
  end

  def move
    redirect_to root_path if @item.buyer.present? || user_signed_in? && current_user.id == @item.user.id
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.item_price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
