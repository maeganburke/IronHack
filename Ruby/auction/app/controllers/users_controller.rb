class UsersController < ApplicationController
	
	def new
		@user = User.new
	end

	def show
		@user = User.find(params[:id])
	end

	def create
		@user = User.new(user_params)

		if @user.save
			redirect_to users_path
		else
			render :new
		end
	end

	def index
		@users = User.order(created_at: :asc)
	end

private

	def user_params
		params.require(:user).permit(:name, :email)
	end

end
