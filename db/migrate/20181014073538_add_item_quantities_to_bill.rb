class AddItemQuantitiesToBill < ActiveRecord::Migration[5.2]
  def change
    add_column :bills, :item_quantities, :integer, array: true, default: '{}'
  end
end
