class ItemsController < ApplicationController

  before_action :login_check, only: [:edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit]


  def index
    @items = Item.includes(:user).order('created_at DESC')
    
  end

  def new
    @item = Item.new    
  end
  
  def update
    @item = Item.find(params[:id])
    if @item.update(items_params)
      redirect_to root_path
    else
      render :edit
    end
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

  def set_item
    @item = Item.find(params[:id])
  end
end