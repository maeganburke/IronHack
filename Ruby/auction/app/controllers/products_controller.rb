class ProductsController < ApplicationController

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)

		if @product.save
			redirect_to products_path
		else
			render :new
		end
	end

	def index
		@products = Product.order(title: :desc)
	end

	def show
		@product = Product.find(params[:id])
		@bids = Product.bids
		@bid = Bid.new
	end

	def search
	  	@products = Product.search_by_letter(params[:search_for])
	    render :search
 	end

 	def searchfor
		@products = Product.search_by_letter(params[:search_for])
		render :searchfor
 	end

private

	def product_params
		params.require(:product).permit(:title, :description, :deadline)
	end
end
