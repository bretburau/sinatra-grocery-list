class AddQuantityToGrocery < ActiveRecord::Migration[5.1]
  def change
    add_column :groceries, :quantity, :integer
  end
end
