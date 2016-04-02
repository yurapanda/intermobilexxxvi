class CommentsController < ApplicationController
	before_action :authenticate_user!

	

	def create
		@cars_todo_list = CarsTodoList.find(params[:cars_todo_list_id])
		@comment = Comment.create(params[:comment].permit(:content))
		@comment.user_id = current_user.id
		@comment.cars_todo_list_id = @cars_todo_list.id

		if @comment.save
			redirect_to cars_todo_list_path(@cars_todo_list)
		else
			render 'new'
		end
	end
end
