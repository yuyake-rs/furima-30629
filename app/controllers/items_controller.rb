class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show]
  def index
    @items = Item.includes(:user).order('created_at DESC')
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

  def show
  end

  def edit
    redirect_to root_path unless current_user == @item.user
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to(@item)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :information, :category_id, :condition_id, :delivery_fee_id, :ship_from_location_id, :delivery_start_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
