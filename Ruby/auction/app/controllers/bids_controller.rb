class BidsController < ApplicationController

	def new
		@bid = Bid.new
	end

	def create
		@bid = Bid.new(bid_params)

		if @bid.save
			redirect_to '/products'
		else 
			render :new
		end
	end

private

	def bid_params
		params.require(:bid).permit(:amount, :user_id, :product_id)
	end
end
