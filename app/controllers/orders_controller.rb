class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_product, only: [:index, :create]
  before_action :sold?, only: [:create]
  

  def index
    @shipping_address = ShippingAddress.new
    if user_signed_in?
      if current_user.id == @product.user_id || @product.order.present?
        redirect_to root_path
      end
    else
      redirect_to new_user_session_path
    end
  end

  def new
    @shipping_address = ShippingAddress.new
  end

  def create
    @shipping_address= ShippingAddress.new(order_params)
    @order = Order.new(product_id: @product.id, user_id: current_user.id)
     
    if @shipping_address.valid?
      pay_item
      @shipping_address.save
      redirect_to root_path
    else
      render :index
    end    
  end


  private

  def find_product
    @product = Product.find(params[:product_id])
  end

  def order_params
  params.require(:shipping_address).permit(:post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(product_id: params[:product_id], user_id: current_user.id,token: params[:token])
  end



  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @product.price,       # 商品の値段
      card: order_params[:token], # カードトークン
      currency: 'jpy'             # 通貨の種類（日本円）
    )
  end
  
  def sold?
    if (user_signed_in? && current_user.id == @product.user_id) || @product.order.present?
      redirect_to root_path
    elsif user_signed_in? == false
      redirect_to new_user_session_path 
    end
  end
  
end

