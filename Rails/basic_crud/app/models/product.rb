class Product < ApplicationRecord
  # has_one :user, through :profiles
  # belongs_to :user
  has_many :posts, through :profiles
  # validates :name, :price, presence: true
  # before_create :wel
  # private
  # def wel
  #   puts "Welcome Our New User"
  # end
end
