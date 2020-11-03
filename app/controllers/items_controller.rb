class ItemsController < ApplicationController
	def index
		# @items = Item.order("created_at DESC")
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

  private
  def item_params
		params.require(:item).permit(:name, :information, :category_id, :condition_id, :delivery_fee_id, :ship_from_location_id, :delivery_start_id, :price, :image).merge(user_id: current_user.id)
  end
end
