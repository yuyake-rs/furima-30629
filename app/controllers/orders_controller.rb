class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @item_order = ItemOrder.new
  end

  def new
  end

  def create
    @item = Item.find(params[:item_id])
		@item_order = ItemOrder.new(order_params)
		# @item_order = @item_order.phone_number.gsub(/-/,'')
    if @item_order.valid?
      @item_order.save
      redirect_to root_path
    else
      render action: :index
		end
  end

  private

  def order_params
    params.permit(:post_code, :ship_from_location_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end
end
