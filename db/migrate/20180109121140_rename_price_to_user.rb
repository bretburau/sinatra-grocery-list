class RenamePriceToUser < ActiveRecord::Migration[5.1]
  def change
    rename_column :recipes, :grocery_id, :user_id
  end
end
