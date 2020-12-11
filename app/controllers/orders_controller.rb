class OrdersController < ApplicationController
	before_action :authenticate_user!, only: [:index]
  def index
    @item = Item.find(params[:item_id])
		if @item.order != nil
      redirect_to root_path
    elsif current_user.id == @item.user_id
      redirect_to root_path
    else
      @item_order = ItemOrder.new
		end
		
  end

  def new
  end

  def create
    @item = Item.find(params[:item_id])
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

  def order_params
    params.permit(:post_code, :ship_from_location_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
