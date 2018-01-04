class ChangeGroceryColumn < ActiveRecord::Migration[5.1]
  def change
    change_column :groceries, :price, :float
  end
end
