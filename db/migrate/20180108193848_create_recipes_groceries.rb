class CreateRecipesGroceries < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes_groceries do |t|
      t.integer :recipe_id
      t.integer :grocery_id
    end
  end
end
