class RecipesGrocery < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :grocery
end