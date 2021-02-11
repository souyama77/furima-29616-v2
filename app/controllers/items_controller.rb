class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update]

  def index
    @items = Item.all.order("created_at DESC")
  end
  def new
    @item = Item.new
  end
  def show

  end
  def edit

    if current_user.id != @item.user_id
      redirect_to root_path
    end
  end
  def update

    if @item.update(item_params) && current_user.id == @item.user_id
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
  def set_item
    @item = Item.find(params[:id])
  end
end