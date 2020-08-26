class OrdersController < ApplicationController
  before_action :set_item, exept: :new
  before_action :move_to_root
  before_action :move_to_top
  
  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @order = OrderAddress.new
  end

  def create
    @order = OrderAddress.new(order_params)
    if @order.valid?
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.permit(:token, :post_code, :prefecture_id, :city, :house_number, :building_number,:phone_number, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      price: @item.price,
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end  

  def move_to_root
    unless @item.order == nil
      redirect_to root_path
    end
  end
   
  def move_to_top
    if currrent_uesr.id == @item.id
    redirect_to root_path
    end
  end

end
