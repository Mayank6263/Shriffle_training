class Product < ApplicationRecord
	validates :name,:price,:quantity, presence: true
	before_create :wel
	private
	def wel
		puts "Welocome Our New User"
	end
end
