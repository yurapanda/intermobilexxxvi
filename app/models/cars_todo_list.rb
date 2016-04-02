class CarsTodoList < ActiveRecord::Base
	has_many :service_todos
	belongs_to :user
	has_many :comments
	

#validations
	
	validates :car_plate_number, 		 presence: true, length: {maximum: 8, minimum: 1}
	
	validates :car_owner_email, 		 presence: true
	
	

 	
	

	






	def ready_for_pickup?
  		!ready_for_pickup_at.blank? 
  	end

  	def pickedup?
  		 !pickedup_at.blank?
  	end

  	def has_image?
  		 !image.blank?
  	end
end
