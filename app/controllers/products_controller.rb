class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :set_product, only: [:show, :edit, :update, :move_to_index, :destroy]
  before_action :require_same_user, only: [:edit, :move_to_index,:destroy]


  def index 
    @products = Product.all.order(created_at: :desc)
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

  def update
    if @product.update(product_params)
      redirect_to product_path(@product)
    else
      @product.save
    render :edit ,status: :unprocessable_entity
    end
  end
  
  def move_to_index
  end

  def destroy
    if @product.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :image,:category_id ,:condition_id,:shippingfee_id,:prefecture_id,:scheduleddelivery_id,:price).merge(user_id: current_user.id,)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def require_same_user
    unless current_user.id == @product.user_id
      redirect_to root_path
    end
  end
 

end
