class ItemsController < ApplicationController
  before_action :redirect_user_session_path, except: [:index, :show]
  before_action :set_item, only: [:edit, :show]

  def index
    @items = Item.all.includes(:user).order('created_at DESC')
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

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to show
    else
      render :edit
    end
  end
    
  def show
  end

  private

  def redirect_user_session_path
    redirect_to user_session_path unless user_signed_in?
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :name, :info, :price, :category_id, :condition_id, :delivery_fee_id, :prefecture_id, :delivery_date_id).merge(user_id: current_user.id)
  end
end
