class Product < ApplicationRecord
	belongs_to :user
	validates :name, :price, presence: true
	before_create :wel
	private
	def wel
		puts "Welcome Our New User"
	end
end
