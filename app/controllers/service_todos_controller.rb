class ServiceTodosController < ApplicationController
	before_action :set_cars_todo_list
	before_action :set_service_todo, except: [:create]
	

	def create
		@service_todo = @cars_todo_list.service_todos.create(service_todo_params)
		
		if @service_todo.save
			redirect_to @cars_todo_list, notice: "Added Successfully, Please Update Bill Summary"
		else
			redirect_to @cars_todo_list, notice: "Input Error/ Price should be 0 or higher"
		end
	end

	def destroy
		if @service_todo.destroy
			flash[:success] = "Service Removed" 
		else
			flash[:error] = "Service Could not be removed"
		end
		redirect_to @cars_todo_list
	end

	def completed
		@service_todo.update_attribute(:completed_at, Time.now)
		redirect_to @cars_todo_list, notice: "Service Completed"
	end 	

	def on_going
		@service_todo.update_attribute(:started_at, Time.now)
		redirect_to @cars_todo_list, notice: "Service On-going"
	end 	

	def paid
		@service_todo.update_attribute(:paid_at, Time.now)
		redirect_to @cars_todo_list, notice: "Service Paid, Please Update the Bill Balance"
	end 	
	private

	def set_cars_todo_list
		@cars_todo_list = CarsTodoList.find(params[:cars_todo_list_id])
	end

	def service_todo_params
		params[:service_todo].permit(:content,:price)
	end
	def set_service_todo
		@service_todo = @cars_todo_list.service_todos.find(params[:id])
	end
end
