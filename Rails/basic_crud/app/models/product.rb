class Product < ApplicationRecord
  has_many :profiles, as: :midiator
  # has_one :user, through :profiles
  # belongs_to :user
  # has_one :profile
  # has_one :post, through: :profile

  # belongs_to :profiles

  # has_one :posts, through: :profiles
  # validates :name, :price, presence: true
  # before_create :wel
  # private
  # def wel
  #   puts "Welcome Our New User"
  # end
end
