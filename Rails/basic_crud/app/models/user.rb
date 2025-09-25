# require "byebug"
class User < ApplicationRecord
  # has_and_belongs_to_many :posts
  has_many :posts
  alias_attribute :new_age, :age
  alias_attribute :new_name, :username

  # def m1
  # 	"me delegate hu"
  # end

  # attr_accessor :change_age
  
  # def change_age(age)
  # 	byebug
  # 	update(age: age)
  # end


  # user = User.preload(:posts).where(id:8)#will work but
  # user = User.preload(:posts).where(posts: {id:8})#will work but

  # attr_accessor :ages
	#in case of has_one to create an instance we uses create_tablenameInsingular instead of create
	# has_one :product#, through: :profiles
	# validates :username, format: {with:/\A[a-zA-Z]+\z/,message:"only contain letters"} 
	# validates :password, :age, presence:true
	# validates :password, confirmation: true #options:- {case_sensitivity: true}
	# validates :password, length: {minimum: 6}#{maximum: 20}or {in: 6..20} {is: 8}
	# validates :confirm_password, presence: true 
	# validates :confirm_username, presence: true 
	#presence of confirming input must be true
	#if presence: true is not present will show error(Argument Error):Need to supply atleast one error
end