class ItemsController < ApplicationController

  before_action :login_check, only: [:edit, :update, :destroy]

  def index
    @items = Item.includes(:user).order('created_at DESC')
    
  end

  def new
    @item = Item.new    
  end
  
  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to root_path
    else
      render :new 
    end
  end
  

  private
  def items_params
    params.require(:item).permit(:name,:product_name, :product_description, :price, :introduction, :category_id, :condition_id, :state_id, :region_id, :postage_id, :shipping_time_id, :image).merge(user_id: current_user.id)
  end
    
  
  
  def login_check
    unless user_signed_in?
      flash[:alert] = 'ログインしてください'
      redirect_to root_path
    end
  end
end