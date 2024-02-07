class OrdersController < ApplicationController

  def index 
    @product = Product.find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :image,:category_id ,:condition_id,:shippingfee_id,:prefecture_id,:scheduleddelivery_id,:price).merge(user_id: current_user.id,)
  end
end
