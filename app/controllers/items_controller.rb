class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index ]
  def index
    @items = Item.all.order("created_at DESC")
  end
  def new
    @item = Item.new
  end
  def show
    @item = Item.find(params[:id])
  end
  def edit
    @item = Item.find(params[:id])
  end
  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
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
    params.require(:item).permit(
      :name,
      :explanation,
      :category_id,
      :item_condition_id,
      :postage_payer_id,
      :prefecture_code_id,
      :preparation_day_id,
      :price,
      :image
    ).merge(user_id: current_user.id)
  end
end