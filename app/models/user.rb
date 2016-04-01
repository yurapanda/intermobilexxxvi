class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         #:recoverable, :, :
         :trackable, :rememberable , :validatable#, #


  has_many :cars


  validates :first_name, 			presence: true, length: {minimum: 2, maximum: 20}
  validates :last_name, 			presence: true
  validates :contact_number,		presence: true, uniqueness: true
  validates_format_of :contact_number, :with => /((\+63)|0)\d{10}/i,  on: :create, length: {minimum: 11, maximum: 14}
  validates :address, 				presence: true

end
