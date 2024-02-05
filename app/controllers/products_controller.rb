class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index 
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new , status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end
  
  private

  def product_params
    params.require(:product).permit(:name, :description, :image,:category_id ,:condition_id,:shippingfee_id,:prefecture_id,:scheduleddelivery_id,:price).merge(user_id: current_user.id,)
  end
end
