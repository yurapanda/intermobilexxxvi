class ServiceTodo < ActiveRecord::Base
  belongs_to :cars_todo_list

  validates :content, 				presence: true
  validates :price,           presence: true, numericality: {greater_than_or_equal_to: 0}
  
  def ongoing?
    !started_at.blank?
  end

  def completed?
  	!completed_at.blank? && !started_at.blank?
  end

  def paid?
  	!paid_at.blank?
  end

end
