class TasksController < ApplicationController

	def index
		@tasks = Task.order(details: :asc)
		render json: @tasks
	end

	def create
		@user = User.find(params[:user_id])
		@task = Task.create(task_params)

		render json: @task
	end

	def delete
		
	end

	def show
		
	end

	def complete
		
	end

private 

	def task_params
		params.require(:task).permit(:details, :user_id)
	end
end
