class OrdersController < ApplicationController
  before_action :find_product, only: [:index, :create]

  def index 
    @order = Order.new
    @shipping_address = ShippingAddress.new
    if current_user == @product.user 
      redirect_to root_path
    end
  end

  def new
    @shipping_address = ShippingAddress.new
  end

  def create
    @shipping_address= ShippingAddress.new(order_params)
    @order = Order.new(product_id: @product.id, user_id: current_user.id)
    if @shipping_address.valid?
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
  params.require(:shipping_address).permit(:post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(product_id: @product.id, user_id: current_user.id)
  end

end
