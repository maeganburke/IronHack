class UsersController < ApplicationController

	def index
		@users = User.order(name: :asc)
		render json: @users
	end

	def create
		@user = User.create(user_params)
		render json: @user
	end

	def show
		@user = User.find(params[:id])
		render json: @user
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		render json: @user
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		render json: @user
	end

private

def user_params
	params.require(:user).permit(:name, :email)
end

end
