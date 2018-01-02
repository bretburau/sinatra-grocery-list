class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :price
      t.integer :grocery_id
    end
  end
end
