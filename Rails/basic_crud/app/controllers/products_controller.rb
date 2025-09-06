class ProductsController < ApplicationController
	def index
	    @products = Product.all
	  end

	def new
		@product = Product.new
	end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Succesfully Created #{@product.name} Product."
      redirect_to @product
    else
      flash.now[:alert] = "Error in Creating Product."
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to @product
      flash[:notice] = "Succesfully Created #{@product.name} Product."
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
    flash[:notice] = "Succesfully Deleted #{@product.name}."

  end

  private

  def product_params
  	params.require(:product).permit(:name, :quantity, :price)
  end
end
