class ItemsController < ApplicationController

  before_action :login_check, only: [:new, :create, :edit, :update, :destroy]

  def index
  end

  def create
    
  end


end
