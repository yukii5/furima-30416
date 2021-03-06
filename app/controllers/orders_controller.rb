class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :edit, :update, :pay_item, :create]
  before_action :move_to_index, only: [:index]
  before_action :authenticate_user!,onry: [:index, :show]

  def index
    @address_form = AddressForm.new
  end

  
  
  def create
    @address_form = AddressForm.new(order_params)
    if @address_form.valid?
      pay_item
      @address_form.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private
  
  def order_params
    params.permit(:postal_code, :region_id, :municipalities, :house_number, :building_name, :phone_number, :price).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id], order_id: params[:order_id])
  end
  
  def set_item
    @item = Item.find(params[:item_id])
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price, 
      card: order_params[:token],  
      currency: 'jpy'
    )
  end
  
  def move_to_index
    redirect_to root_path if @item.user == current_user || @item.order.present?
  end
end
  