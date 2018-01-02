class Recipe < ActiveRecord::Base
  has_many :groceries
end