class Comment < ActiveRecord::Base
  belongs_to :cars_todo_list
  belongs_to :user
end
