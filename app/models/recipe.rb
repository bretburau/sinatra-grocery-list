class Recipe < ActiveRecord::Base
  has_many :recipes_groceries
  has_many :groceries, through: :recipes_groceries
end