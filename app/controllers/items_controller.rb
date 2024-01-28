class ItemsController < ApplicationController
  def index
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(products_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  private

  def product_params
    params.require(:product).permit(:content, :image,:genre_id).merge(user_id: current_user.id,)
  end
end
