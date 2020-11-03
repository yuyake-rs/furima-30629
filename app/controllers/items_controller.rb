class ItemsController < ApplicationController
	def index
		@item = Item.order("created_at DESC")
	end
	
	private

  def message_params
    params.require(:item).permit(:name, :information, :category_id, :condition_id, :delivery_fee_id, :ship_from_location_id, :delivery_start_id, :price :image).merge(user_id: current_user.id)
  end
end
