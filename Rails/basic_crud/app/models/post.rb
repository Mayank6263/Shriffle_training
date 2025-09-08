class Post < ApplicationRecord
	# change it to singular
	# validates :p1, presence:{message:"name can't be blank."}
	# => 	Older versions syntax also works fine
	validates_presence_of :p1, presence: true
	validates :p1, uniqueness: true
	#validates :p1 , presence: { strict:true}
	# validates :p1, inclusion: { in: %w[rails no ruby], message: "Please add any rails, no, ruby %{value} "}
	validates :p1, exclusion: { in: %w[rails no ruby], message: "Please remove these words rails, no, ruby %{value} "}
	
	# => 		Custom Validations
	# validate :contain
	# def contain
	# 	unless p1.include?('rails')
	# 		errors.add("string must contain 'rails'");
	# 	end
	# end



	# Callbacks in rails using Logger.info
	# after_create -> {Rails.logger.info("created post success.")}
	
	# => 	Ways to define callbacks
	#Ist way
	# before_validation :m1
	# private
	# def m1
	# 	p "i am callback"
	# end

	#IInd way
	# before_validation do
	# 	p "i am callback"
	# end

	# IIIrd Way
	# before_validation -> {p "i am callback"}


	
end
