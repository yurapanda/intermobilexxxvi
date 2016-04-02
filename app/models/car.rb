class Car < ActiveRecord::Base
  belongs_to :car_model
  belongs_to :user
  has_many :service_records
end
