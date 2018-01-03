class User < ActiveRecord::Base
  # has_many :groceries, through :recipes  ####todo set this relation up
  has_many :recipes
  has_secure_password
end