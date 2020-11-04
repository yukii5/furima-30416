class ItemsController < ApplicationController
  
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, except: [:index, :show]

  
  def index
    @items = Item.includes(:user).
    order('created_at DESC')

  end
  
  def new
    @item = Item.new
  end
  
  def edit
    if current_user.id != @item.user_id || Order.exists?(item_id: @item.id)
      redirect_to root_path
    end
  end
  

  
  def update
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

  def destroy
    if @item.destroy
      redirect_to root_path 
    else
      render :show
    end
  end

  private
  def items_params
    params.require(:item).permit(:name,:product_name, :product_description, :price, :introduction, :category_id, :condition_id, :state_id, :region_id, :postage_id, :shipping_time_id, :image).merge(user_id: current_user.id)
  end


    
  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to root_path
    end
  end

end