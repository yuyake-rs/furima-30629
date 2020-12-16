class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_items, only: [:index, :create, :pay_item]
  def index
    if !@item.order.nil? || current_user.id == @item.user_id
      redirect_to root_path
    else
      @item_order = ItemOrder.new
    end
  end

  def create
    @item_order = ItemOrder.new(order_params)
    if @item_order.valid?
      pay_item
      @item_order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def set_items
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.permit(:post_code, :ship_from_location_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
