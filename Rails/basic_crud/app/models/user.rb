class User < ApplicationRecord
	has_many :products
	validates :username, format: {with:/\A[a-zA-Z]+\z/,message:"only contain letters"} 
	validates :password, :age, presence:true
	# validates :password, confirmation: true #options:- {case_sensitivity: true}
	validates :password, length: {minimum: 6}#{maximum: 20}or {in: 6..20} {is: 8}
	# validates :confirm_password, presence: true 
	# validates :confirm_username, presence: true 
	#presence of confirming input must be true
	#if presence: true is not present will show error(Argument Error):Need to supply atleast one error
end