class OrdersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_item
  before_action :move_to_index
  def index
    @order = PayForm.new
  end
  def create
    @order = PayForm.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end
  def pay_item

    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: "jpy"
    )
  end
  def order_params
    params.require(:pay_form).permit(
    :postal_code,
    :prefecture_code_id,
    :city,
    :house_number,
    :building_name,
    :phone_number
    ).merge(
      user_id: current_user.id,
      item_id: params[:item_id],
      token: params[:token]
    )
  end
  def move_to_index
    unless user_signed_in? && current_user.id != @item.user_id
      redirect_to root_path
    end
  end
end