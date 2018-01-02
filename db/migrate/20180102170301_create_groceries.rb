class CreateGroceries < ActiveRecord::Migration[5.1]
  def change
    create_table :groceries do |t|
      t.string :name
      t.integer :quantity
      t.integer :price
    end
    
  end
end
