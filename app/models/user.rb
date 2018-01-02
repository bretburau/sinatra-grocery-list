class User < ActiveRecord::Base
  # has_many :groceries, through :
  has_many :recipes
  has_secure_password
end