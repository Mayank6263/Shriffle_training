class ProductsController < ApplicationController
	def index
	    @products = Product.all
	  end

	def new
		@product = Product.new
	end

  def create
    @product = Product.new(product_params)
    if @product
      redirect_to @product, notice: "Succesfully Created Posts."
    else
      render :new
    end
  end

  def show
    # @product = Product.find(params[:id])
  end

  def edit
    # @product = Product.find(params[:id])
  end

  def update
    @product = Product.new(product_params)

    if @product.update(product_params)
      redirect_to @product, notice:"Product Updated Succesfully."
    else
      render :edit
    end
  end

  def destroy
    @product = Product.new(product_params)
    @product.destroy
    redirect_to products_path, notice:"Succesfully Deleted Product."
  end

  private

  def product_params
  	params.require(:product).permit(:name, :quantity, :price)
  end
end
