class ItemsController < ApplicationController
  before_action :redirect_user_session_path, except: :index

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
  
  private

  def redirect_user_session_path
    redirect_to user_session_path unless user_signed_in?
  end
  
  def item_params
    params.require(:item).permit(:image, :name, :info, :price,:category_id,:condition_id, :delivery_fee_id, :delivery_region_id, :delivery_date_id).merge(user_id: current_user.id)
  end  
end
