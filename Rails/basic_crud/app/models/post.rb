class Post < ApplicationRecord
	# change it to singular
	# validates :p1, presence:{message:"name can't be blank."}
	# => 	Older versions syntax also works fine
	validates_presence_of :p1, :p2, presence: true
	validates :p1, uniqueness: true
	#validates :p1 , presence: { strict:true}
	# validates :p1, inclusion: { in: %w[rails no ruby], message: "Please add any rails, no, ruby %{value} "}
	# validates :p1, exclusion: { in: %w[rails no ruby], message: "Please remove these words rails, no, ruby %{value} "}
	
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
	# before_validation -> {p "i am before_validation callback."}

	# => 				CREATE PHASE	
	# before_validation -> {p "i am before_validation callback."}
	# after_validation -> {p "i am after_validation callback."}
	# before_save -> {p ' before_save validation.'}
	# around_save -> {p ' around_save validation.'}
	# before_commit -> {p ' before_commit validation.'}
	# before_create -> {p ' before_create validation.'}
	# around_create -> {p ' around_create validation.'}
	# after_create -> {p ' after_create validation.'}
	# after_save -> {p ' after_save validation.'}
	# after_commit -> {p 'after_commit validation.'}
	after_rollback -> {p ' after_rollback validation.'}



	#=> 				UPDATE PHASE
	# before_validation -> {p "i am before_validation callback."}
	# after_validation -> {p "i am after_validation callback."}
	# before_save -> {p ' before_save validation.'}
	# around_save -> {p ' before_save validation.'}
	# before_commit -> {p ' before_commit validation.'}
	# before_create -> {p ' before_create validation.'}
	# around_create -> {p ' around_create validation.'}
	# after_create -> {p ' after_create validation.'}
	# after_save -> {p ' after_save validation.'}
	# after_commit -> {p 'after_commit validation.'}
	# after_rollback -> {p ' after_rollback validation.'}



	#=>					DELETION PHASE
	# before_destroy -> {p 'before_destroy validation'}
	# around_destroy -> {p 'around_destroy validation'}
	# after_destroy -> {p 'after_destroy validation'}
	# after_commit -> {p 'after_commit validation'}
	# after_rollback -> {p 'after_rolback validation'}




	# after_initialize do |x|
	# 	Rails.logger.info("You have initialize record.")
	# end

	# after_find do |x|
	# 	Rails.logger.info("You found the record which you are searching #{x}")
	# end

	# after_touch -> {"After touch command."}
	
end
